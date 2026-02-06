import 'package:evently/firebase_serves.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:evently/widgets/default_elevated_botton.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:evently/widgets/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateEventScreen extends StatefulWidget {
  static String routeName = '/CreateEvent';

  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  CategoryModel selectedCategory = CategoryModel.categories.first;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: Text('Add Event'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/${selectedCategory.imageName}.png',
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: DefaultTabController(
                length: CategoryModel.categories.length,
                child: TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  padding: EdgeInsets.only(left: 16),
                  labelPadding: EdgeInsets.only(right: 8),
                  tabAlignment: .start,
                  onTap: (index) {
                    if (CategoryModel.categories[index].id ==
                        selectedCategory.id)
                      return;
                    setState(() {
                      selectedCategory = CategoryModel.categories[index];
                    });
                  },
                  tabs: CategoryModel.categories
                      .map(
                        (category) => TapItem(
                          label: category.name,
                          icon: category.icon,
                          isSelected: category.id == selectedCategory.id,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Title',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    DefaultTextFormField(
                      hintText: 'Event Title',
                      controller: titleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event title';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                    DefaultTextFormField(
                      hintText: 'Event Description ...',
                      maxLines: 5,
                      controller: descriptionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter event description';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/calendar.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Event Date',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              initialDate: selectedDate ?? DateTime.now(),
                            );

                            if (date != null) {
                              setState(() {
                                selectedDate = date;
                              });
                            }
                          },
                          child: Text(
                            selectedDate == null
                                ? 'Choose Date'
                                : selectedDate!.toLocal().toString().split(
                                    ' ',
                                  )[0],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/clock.svg',
                          width: 24,
                          height: 24,
                          fit: BoxFit.scaleDown,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Event Time',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () async {
                            TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedTime ?? TimeOfDay.now(),
                            );

                            if (time != null) {
                              setState(() {
                                selectedTime = time;
                              });
                            }
                          },
                          child: Text(
                            selectedTime == null
                                ? 'Choose Time'
                                : selectedTime!.format(context),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    DefaultElevatedBotton(
                      label: 'Add Event',
                      onPressed: createEvent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createEvent() {
    if (formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      EventModel event = EventModel(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: DateTime(
          selectedDate!.year,
          selectedDate!.month,
          selectedDate!.day,
          selectedTime!.hour,
          selectedTime!.minute,
        ),
        category: selectedCategory,
      );
      FirebaseServes.createEvent(event)
          .then((_) {
            Navigator.of(context).pop();
            UiUtils.showSuccessMesssage('Event Created Success');
          })
          .catchError((_) => UiUtils.showErrorMessage('Faild to create event'));
    }
  }
}
