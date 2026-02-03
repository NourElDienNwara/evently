import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/sport.png',
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
            '21 Jan',
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
            margin: EdgeInsets.symmetric(horizontal: 8,),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.light.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'This is a Birthday Party',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.light.mainText,
                    ),
                  ),
                ),
                
                SizedBox(width: 8,),
                Icon(Icons.favorite_outline),
              ],
            ),
          ),
        ),
      ],
    );
  }
}