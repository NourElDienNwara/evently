import 'package:evently/app_theme.dart';
import 'package:evently/models/language_option_mogel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 58,
          ),

          SizedBox(height: 16),

          Text(
            'User Name',
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: .w600),
          ),

          SizedBox(height: 4),

          Text(
            'username@gmail.com',
            style: Theme.of(context).textTheme.titleSmall,
          ),

          SizedBox(height: 32),

          SwitchListTile(
            title: Text('Dark Mode'),
            value: false,
            onChanged: (value) {},

            activeTrackColor: Theme.of(context).primaryColor,
            inactiveTrackColor: AppTheme.light.stoke,
            thumbColor: WidgetStatePropertyAll(Colors.white),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),

          SizedBox(height: 16),

          ListTile(
            title: Text('Language'),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("اختار اللغة"),
                    content: Text("من فضلك اختر لغة التطبيق"),
                    actions: LanguageOptionMogel.options.map((language) => TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(language.name),
                    )).toList(),
                  ),
                );
              },

              icon: SvgPicture.asset(
                'assets/icons/arrow-right.svg',
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
            ),
          ),

          SizedBox(height: 16),

          ListTile(
            title: Text('Log Out'),
            trailing: SvgPicture.asset(
              'assets/icons/logout.svg',
              width: 24,
              height: 24,
              fit: .fill,
            ),
          ),
        ],
      ),
    );
  }
}


