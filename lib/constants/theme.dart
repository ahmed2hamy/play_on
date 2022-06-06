part of 'constants.dart';

final ThemeData kAppThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  primarySwatch: kPrimarySwatch,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primaryColorDark: kPrimaryColor,
    accentColor: kAccentColor,
    primarySwatch: kPrimarySwatch,
    backgroundColor: Colors.white,
    errorColor: kErrorColor,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: kTitleTextStyle,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
);
