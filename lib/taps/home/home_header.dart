import 'package:evently/models/category_model.dart';
import 'package:evently/taps/home/tap_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16,),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Welcome Back ✨', style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 4,),
          Text('John Safwat', style: Theme.of(context).textTheme.titleLarge,),
    
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
                tabs: [
                  TapItem(label: 'All', icon: Icons.category_outlined, isSelected: true),
                  ...CategoryModel.categories.map((categoryModel) => TapItem(label: categoryModel.name, icon: categoryModel.icon, isSelected: false)),
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}