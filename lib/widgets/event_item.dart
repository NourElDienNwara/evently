import 'package:evently/app_theme.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel events;

  EventItem(this.events);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/${events.category.imageName}.png',
            height: MediaQuery.of(context).size.height * 0.23,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),

        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.light.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            DateFormat('d MMM').format(events.dateTime),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),

        Positioned(
          width: MediaQuery.of(context).size.width - 32,
          bottom: 8,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.light.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    events.title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.light.mainText,
                    ),
                  ),
                ),

                SizedBox(width: 8),
                Icon(Icons.favorite_outline),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
