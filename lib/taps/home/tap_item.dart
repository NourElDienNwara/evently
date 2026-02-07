import 'package:evently/app_theme.dart';
import 'package:evently/models/category_model.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TapItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;

  TapItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).primaryColor
            : settingsProvider.isDark
            ? AppTheme.dark.inputs
            : AppTheme.light.inputs,
        borderRadius: .circular(16),
        border: isSelected ? null : Border.all(color: settingsProvider.isDark ? AppTheme.dark.stoke : AppTheme.light.stoke),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.white : Theme.of(context).primaryColor,),
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
