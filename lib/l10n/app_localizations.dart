import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('en'),
    Locale('ru'),
    Locale('tr')
  ];

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the World of Languages'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Energistically implement expan arrchannels through visionary methods quickly customize act deploy functionality'**
  String get welcomeSubtitle;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create An Account'**
  String get createAccount;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to Your \nAccount'**
  String get loginTitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @createFreeAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your free \nAccount'**
  String get createFreeAccount;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @yourEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get yourEmail;

  /// No description provided for @privacyPolicyAgree.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agreed with our Services and Privacy Policy'**
  String get privacyPolicyAgree;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have account?'**
  String get alreadyHaveAccount;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// No description provided for @popularCourses.
  ///
  /// In en, this message translates to:
  /// **'Popular Courses'**
  String get popularCourses;

  /// No description provided for @coursesFound.
  ///
  /// In en, this message translates to:
  /// **'Courses Found'**
  String get coursesFound;

  /// No description provided for @instructorsFound.
  ///
  /// In en, this message translates to:
  /// **'Instructors Found'**
  String get instructorsFound;

  /// No description provided for @instructors.
  ///
  /// In en, this message translates to:
  /// **'Instructors'**
  String get instructors;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get viewAll;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello,'**
  String get hello;

  /// No description provided for @noCoursesFound.
  ///
  /// In en, this message translates to:
  /// **'No courses found'**
  String get noCoursesFound;

  /// No description provided for @noInstructorsFound.
  ///
  /// In en, this message translates to:
  /// **'No instructors found'**
  String get noInstructorsFound;

  /// No description provided for @calendarPage.
  ///
  /// In en, this message translates to:
  /// **'Calendar Page'**
  String get calendarPage;

  /// No description provided for @editNotesPage.
  ///
  /// In en, this message translates to:
  /// **'Edit/Notes Page'**
  String get editNotesPage;

  /// No description provided for @courseDetails.
  ///
  /// In en, this message translates to:
  /// **'Course Details'**
  String get courseDetails;

  /// No description provided for @aboutCourse.
  ///
  /// In en, this message translates to:
  /// **'Detailed information about this course will be here. The best choice for learning English quickly and effectively!'**
  String get aboutCourse;

  /// No description provided for @noFavoritesYet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t liked any courses yet '**
  String get noFavoritesYet;

  /// No description provided for @favoriteCourses.
  ///
  /// In en, this message translates to:
  /// **'Favorite Courses'**
  String get favoriteCourses;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose the Language'**
  String get chooseLanguage;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @myLessons.
  ///
  /// In en, this message translates to:
  /// **'My lessons'**
  String get myLessons;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @dailyConversation.
  ///
  /// In en, this message translates to:
  /// **'Daily English Conversation'**
  String get dailyConversation;

  /// No description provided for @learnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get learnMore;

  /// No description provided for @itTakes.
  ///
  /// In en, this message translates to:
  /// **'it takes'**
  String get itTakes;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountDescription.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Your account will be permanently deleted.'**
  String get deleteAccountDescription;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirmDelete.
  ///
  /// In en, this message translates to:
  /// **'Yes, Delete'**
  String get confirmDelete;

  /// No description provided for @dailyEnglishConversation.
  ///
  /// In en, this message translates to:
  /// **'Daily English Conversation'**
  String get dailyEnglishConversation;

  /// No description provided for @appLanguageSettings.
  ///
  /// In en, this message translates to:
  /// **'App Language Settings'**
  String get appLanguageSettings;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'You have no notifications'**
  String get noNotifications;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address!'**
  String get errorInvalidEmail;

  /// No description provided for @errorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long!'**
  String get errorPasswordLength;

  /// No description provided for @errorPasswordNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number!'**
  String get errorPasswordNumber;

  /// No description provided for @errorPasswordUpper.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter!'**
  String get errorPasswordUpper;

  /// No description provided for @errorEmailExists.
  ///
  /// In en, this message translates to:
  /// **'This email is already registered!'**
  String get errorEmailExists;

  /// No description provided for @errorGeneral.
  ///
  /// In en, this message translates to:
  /// **'An error occurred!'**
  String get errorGeneral;

  /// No description provided for @errorLoginFailed.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password!'**
  String get errorLoginFailed;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['az', 'en', 'ru', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az': return AppLocalizationsAz();
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
