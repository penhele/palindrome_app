import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

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
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @name.
  ///
  /// In id, this message translates to:
  /// **'Nama'**
  String get name;

  /// No description provided for @palindrome.
  ///
  /// In id, this message translates to:
  /// **'Palindrom'**
  String get palindrome;

  /// No description provided for @nameRequired.
  ///
  /// In id, this message translates to:
  /// **'Nama tidak boleh kosong'**
  String get nameRequired;

  /// No description provided for @palindromeRequired.
  ///
  /// In id, this message translates to:
  /// **'Palindrom tidak boleh kosong'**
  String get palindromeRequired;

  /// No description provided for @check.
  ///
  /// In id, this message translates to:
  /// **'PERIKSA'**
  String get check;

  /// No description provided for @next.
  ///
  /// In id, this message translates to:
  /// **'BERIKUTNYA'**
  String get next;

  /// No description provided for @welcome.
  ///
  /// In id, this message translates to:
  /// **'Selamat datang'**
  String get welcome;

  /// No description provided for @noUserSelected.
  ///
  /// In id, this message translates to:
  /// **'Belum ada pengguna yang dipilih'**
  String get noUserSelected;

  /// No description provided for @chooseUser.
  ///
  /// In id, this message translates to:
  /// **'Pilih Pengguna'**
  String get chooseUser;

  /// No description provided for @emptyData.
  ///
  /// In id, this message translates to:
  /// **'Data kosong'**
  String get emptyData;

  /// No description provided for @failedToLoadData.
  ///
  /// In id, this message translates to:
  /// **'Gagal memuat data'**
  String get failedToLoadData;

  /// No description provided for @checkYourConnection.
  ///
  /// In id, this message translates to:
  /// **'Periksa koneksi Anda!'**
  String get checkYourConnection;

  /// No description provided for @retry.
  ///
  /// In id, this message translates to:
  /// **'Coba Lagi'**
  String get retry;

  /// No description provided for @firstScreen.
  ///
  /// In id, this message translates to:
  /// **'Layar Pertama'**
  String get firstScreen;

  /// No description provided for @secondScreen.
  ///
  /// In id, this message translates to:
  /// **'Layar Kedua'**
  String get secondScreen;

  /// No description provided for @thirdScreen.
  ///
  /// In id, this message translates to:
  /// **'Layar Ketiga'**
  String get thirdScreen;

  /// No description provided for @palindromeCheck.
  ///
  /// In id, this message translates to:
  /// **'Pemeriksaan Palindrom'**
  String get palindromeCheck;

  /// No description provided for @isPalindrome.
  ///
  /// In id, this message translates to:
  /// **'isPalindrome'**
  String get isPalindrome;

  /// No description provided for @notPalindrome.
  ///
  /// In id, this message translates to:
  /// **'Bukan palindrom'**
  String get notPalindrome;
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
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
