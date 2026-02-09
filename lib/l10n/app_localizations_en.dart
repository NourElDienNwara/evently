// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get auth_login_title => 'Login to your accont';

  @override
  String get auth_register_title => 'Create your account';

  @override
  String get auth_name_hint => 'Enter Your Name';

  @override
  String get auth_email_hint => 'Enter Your Email';

  @override
  String get auth_password_hint => 'Enter Your Password';

  @override
  String get auth_confirmPassword_hint => 'Confirm Your Password';

  @override
  String get auth_login_botton => 'Login';

  @override
  String get auth_register_botton => 'Register';

  @override
  String get auth_login_AQ => 'Don\'t have an account?';

  @override
  String get auth_register_AQ => 'Already have an account?';

  @override
  String get home => 'Home';

  @override
  String get home_welcome => 'Welcome Back ✨';

  @override
  String get favorite => 'Favorite';

  @override
  String get favorite_search => 'Search for event';

  @override
  String get profile => 'Profile';

  @override
  String get profile_darkMode => 'Dark Mode';

  @override
  String get profile_language => 'Language';

  @override
  String get profile_logout => 'Log Out';

  @override
  String get profile_titleMessage => 'Choose Language';

  @override
  String get profile_subTitleMessage => 'Please Choose Language App';

  @override
  String get createEvent_pageName => 'Add Event';

  @override
  String get createEvent_title => 'Title';

  @override
  String get createEvent_title_hint => 'Event Title';

  @override
  String get createEvent_description => 'Description';

  @override
  String get createEvent_description_hint => 'Event Description';

  @override
  String get createEvent_eventDate => 'Event Date';

  @override
  String get createEvent_eventTime => 'Event Time';

  @override
  String get createEvent_chooseDate => 'Choose Date';

  @override
  String get createEvent_chooseTime => 'Choose Time';

  @override
  String get createEvent_botton => 'Add Event';
}
