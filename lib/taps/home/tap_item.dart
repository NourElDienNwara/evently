import 'package:evently/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TapItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TapItem({super.key, required this.label, required this.icon, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: .circular(16),
      ),
      child: Row(
        children: [
          Icon(icon,),
          SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isSelected
                  ? Colors.white
                  : Theme.of(context).textTheme.titleMedium!.color,
            ),
          ),
        ],
      ),
    );
  }
}
