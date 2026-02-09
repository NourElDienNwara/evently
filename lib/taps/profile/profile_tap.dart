import 'package:evently/app_theme.dart';
import 'package:evently/auth/login_screen.dart';
import 'package:evently/auth/register_screen.dart';
import 'package:evently/firebase_serves.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/models/language_option_mogel.dart';
import 'package:evently/models/user_model.dart';
import 'package:evently/providers/settings_provider.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    UserModel currentUser = Provider.of<UserProvider>(context).currentUser!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);

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
            currentUser.userName,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontWeight: .w600),
          ),

          SizedBox(height: 4),

          Text(
            currentUser.email,
            style: Theme.of(context).textTheme.titleSmall,
          ),

          SizedBox(height: 32),

          SwitchListTile(
            title: Text(appLocalizations.profile_darkMode),
            value: settingsProvider.isDark,
            onChanged: (isDark) {
              settingsProvider.changeTheme(isDark ? .dark : .light);
            },

            activeTrackColor: Theme.of(context).primaryColor,
            inactiveTrackColor: AppTheme.light.stoke,
            thumbColor: WidgetStatePropertyAll(Colors.white),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          ),

          SizedBox(height: 16),

          ListTile(
            title: Text(appLocalizations.profile_language),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    appLocalizations.profile_titleMessage,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  content: Text(
                    appLocalizations.profile_subTitleMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  backgroundColor: settingsProvider.isDark
                      ? AppTheme.dark.background
                      : AppTheme.light.background,
                  actions: LanguageOptionMogel.options
                      .map(
                        (language) => TextButton(
                          onPressed: () {
                            settingsProvider.changeLanguage(language.code);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            language.name,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
            trailing: SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              width: 24,
              height: 24,
              fit: BoxFit.fill,
            ),
          ),

          SizedBox(height: 16),

          ListTile(
            title: Text(appLocalizations.profile_logout),
            onTap: () {
              FirebaseServes.logout().then(
                (_) => Navigator.of(context)
                    .pushReplacementNamed(LoginScreen.routeName)
                    .then(
                      (_) => Provider.of<UserProvider>(
                        context,
                      ).updateCurrentUser(null),
                    ),
              );
            },
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
