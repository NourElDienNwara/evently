import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String name;
  IconData icon;
  String imageName;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageName,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sport',
      icon: Icons.sports_basketball_outlined,
      imageName: 'sport',
    ),

    CategoryModel(
      id: '2',
      name: 'Book Club',
      icon: Icons.menu_book_outlined,
      imageName: 'bookclub',
    ),

    CategoryModel(
      id: '3',
      name: 'Art',
      icon: Icons.brush_outlined,
      imageName: 'art',
    ),
  ];
}
