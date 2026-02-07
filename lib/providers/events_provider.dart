import 'package:evently/firebase_serves.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/models/event_model.dart';
import 'package:flutter/material.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> desplayedEvents = [];

  Future<void> getEvents() async {
    allEvents = await FirebaseServes.getEvent();
    desplayedEvents = allEvents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      desplayedEvents = allEvents;
    } else {
      desplayedEvents = allEvents
          .where((event) => event.category == category)
          .toList();
    }
    notifyListeners();
  }
}
