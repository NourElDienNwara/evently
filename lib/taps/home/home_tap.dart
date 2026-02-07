import 'dart:math';

import 'package:evently/firebase_serves.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/taps/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);

    return Column(
      children: [
        HomeHeader(),

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) =>
                EventItem(eventsProvider.desplayedEvents[index]),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: eventsProvider.desplayedEvents.length,
          ),
        ),
      ],
    );
  }
}
