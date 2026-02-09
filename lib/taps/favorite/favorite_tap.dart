import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/widgets/default_text_form_field.dart';
import 'package:evently/widgets/event_item.dart';
import 'package:flutter/material.dart';

class FavoriteTap extends StatelessWidget {
  const FavoriteTap({super.key});

  @override
  Widget build(BuildContext context) {

    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DefaultTextFormField(
            hintText: appLocalizations.favorite_search,
            onChanged: (value) {},
            suffixIcon: 'search',
          ),

          SizedBox(height: 16),
      
          // Expanded(
          //   child: ListView.separated(
          //     itemBuilder: (_, index) => EventItem(),
          //     separatorBuilder: (_, _) => SizedBox(height: 16),
          //     itemCount: 10,
          //   ),
          // ),
        ],
      ),
    );
  }
}
