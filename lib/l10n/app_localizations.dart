import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @auth_login_title.
  ///
  /// In en, this message translates to:
  /// **'Login to your accont'**
  String get auth_login_title;

  /// No description provided for @auth_register_title.
  ///
  /// In en, this message translates to:
  /// **'Create your account'**
  String get auth_register_title;

  /// No description provided for @auth_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get auth_name_hint;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get auth_email_hint;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Password'**
  String get auth_password_hint;

  /// No description provided for @auth_confirmPassword_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Your Password'**
  String get auth_confirmPassword_hint;

  /// No description provided for @auth_login_botton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login_botton;

  /// No description provided for @auth_register_botton.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get auth_register_botton;

  /// No description provided for @auth_login_AQ.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get auth_login_AQ;

  /// No description provided for @auth_register_AQ.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get auth_register_AQ;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @home_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back ✨'**
  String get home_welcome;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @favorite_search.
  ///
  /// In en, this message translates to:
  /// **'Search for event'**
  String get favorite_search;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profile_darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get profile_darkMode;

  /// No description provided for @profile_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profile_language;

  /// No description provided for @profile_logout.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get profile_logout;

  /// No description provided for @profile_titleMessage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get profile_titleMessage;

  /// No description provided for @profile_subTitleMessage.
  ///
  /// In en, this message translates to:
  /// **'Please Choose Language App'**
  String get profile_subTitleMessage;

  /// No description provided for @createEvent_pageName.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get createEvent_pageName;

  /// No description provided for @createEvent_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get createEvent_title;

  /// No description provided for @createEvent_title_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Title'**
  String get createEvent_title_hint;

  /// No description provided for @createEvent_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get createEvent_description;

  /// No description provided for @createEvent_description_hint.
  ///
  /// In en, this message translates to:
  /// **'Event Description'**
  String get createEvent_description_hint;

  /// No description provided for @createEvent_eventDate.
  ///
  /// In en, this message translates to:
  /// **'Event Date'**
  String get createEvent_eventDate;

  /// No description provided for @createEvent_eventTime.
  ///
  /// In en, this message translates to:
  /// **'Event Time'**
  String get createEvent_eventTime;

  /// No description provided for @createEvent_chooseDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get createEvent_chooseDate;

  /// No description provided for @createEvent_chooseTime.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get createEvent_chooseTime;

  /// No description provided for @createEvent_botton.
  ///
  /// In en, this message translates to:
  /// **'Add Event'**
  String get createEvent_botton;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
