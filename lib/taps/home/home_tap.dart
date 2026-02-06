import 'dart:math';

import 'package:evently/firebase_serves.dart';
import 'package:evently/models/event_model.dart';
import 'package:evently/taps/home/home_header.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  List<EventModel> events = [];

  @override
  Widget build(BuildContext context) {
    events.isEmpty ? getEvents() : null;
    return Column(
      children: [
        HomeHeader(),

        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (_, index) => EventItem(events[index]),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: events.length,
          ),
        ),
      ],
    );
  }

  Future<void> getEvents() async {
    events = await FirebaseServes.getEvent();
    setState(() {});
  }
}
