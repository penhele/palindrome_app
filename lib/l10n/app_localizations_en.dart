// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleApp => 'Localization App';

  @override
  String get name => 'Name';

  @override
  String get palindrome => 'Palindrome';

  @override
  String get nameRequired => 'Name must not be empty';

  @override
  String get palindromeRequired => 'Palindrome must not be empty';

  @override
  String get check => 'CHECK';

  @override
  String get next => 'NEXT';

  @override
  String get welcome => 'Welcome';

  @override
  String get noUserSelected => 'No user selected';

  @override
  String get chooseUser => 'Choose a User';

  @override
  String get emptyData => 'Empty data';

  @override
  String get failedToLoadData => 'Failed to load data';

  @override
  String get checkYourConnection => 'Check your connection!';

  @override
  String get retry => 'Retry';

  @override
  String get firstScreen => 'First Screen';

  @override
  String get secondScreen => 'Second Screen';

  @override
  String get thirdScreen => 'Third Screen';

  @override
  String get palindromeCheck => 'Palindrome Check';

  @override
  String get isPalindrome => 'isPalindrome';

  @override
  String get notPalindrome => 'not palindrome';
}
