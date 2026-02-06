import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';
import 'package:flutter/foundation.dart';

class EventModel {
  String id;
  String title;
  String description;
  DateTime dateTime;
  CategoryModel category;

  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'categoryID': category.id,
    'title': title,
    'description': description,
    'dateTime': Timestamp.fromDate(dateTime),
  };

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    dateTime: (json['dateTime'] as Timestamp).toDate(),
    category: CategoryModel.categories.firstWhere((category) => category.id == json['categoryID']),
  );
}
