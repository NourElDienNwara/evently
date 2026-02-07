import 'package:evently/app_theme.dart';
import 'package:evently/firebase_serves.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  EventModel event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    bool isFavorite = userProvider.checkIsFavoriteEvent(event.id);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/${event.category.imageName}.png',
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
            DateFormat('d MMM').format(event.dateTime),
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
                    event.title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.light.mainText,
                    ),
                  ),
                ),

                SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    if (isFavorite) {
                      userProvider.addEventToFavorite(event.id);
                    } else {
                      userProvider.removeEventFromFavorite(event.id);
                    }
                  },
                  child: Icon(isFavorite ? Icons.favorite : Icons.favorite_outline),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
