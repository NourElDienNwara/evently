import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    UserModel currentUser = Provider.of<UserProvider>(context).currentUser!;
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Welcome Back ✨', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 4),
          Text(
            currentUser.userName,
            style: Theme.of(context).textTheme.titleLarge,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: DefaultTabController(
              length: CategoryModel.categories.length + 1,
              child: TabBar(
                isScrollable: true,
                tabAlignment: .start,
                labelPadding: EdgeInsets.only(right: 8),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                onTap: (index) {
                  if (index == currentIndex) return;
                  setState(() {
                    currentIndex = index;
                    CategoryModel? selectedCategory = index == 0 ? null :
                        CategoryModel.categories[index - 1];

                    eventsProvider.filterEvents(selectedCategory);
                  });
                },
                tabs: [
                  TapItem(
                    label: 'All',
                    icon: Icons.category_outlined,
                    isSelected: currentIndex == 0,
                  ),
                  ...CategoryModel.categories.map(
                    (categoryModel) => TapItem(
                      label: categoryModel.name,
                      icon: categoryModel.icon,
                      isSelected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(categoryModel) + 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
