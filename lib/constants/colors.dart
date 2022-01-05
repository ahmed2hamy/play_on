part of 'constants.dart';

const Color kPrimaryColor = Color(0xff242C35);
const Color kSecondaryColor = Color(0xff00CA45);
const Color kTeamsScreenBackgroundColor = Color(0xffF2F3F5);
const Color kTeamCardBackgroundColor = Color(0xff95A4BC);
const Color kPLayerPositionTextColor = Color(0xff797f86);
const Color kBlankColor = Color(0xffD1D6DE);
const Color kBorderColor = Color(0xffE0E4E8);
const Color kButtonBorderColor = Color(0xffAFBFC9);
const Color kShadowColor = Color(0x0000003c);
const Color kDropShadowColor = Color(0x0646A619);
const Color kDialogTitleColor = Color(0xff5F6C84);
const Color kHintTextColor = Color(0xffBABABA);

final MaterialColor kPrimarySwatch =
    MaterialColor(kPrimaryColor.hashCode, _primaryColorMap);

Map<int, Color> _primaryColorMap = {
  50: const Color.fromRGBO(36, 44, 53, .1),
  100: const Color.fromRGBO(36, 44, 53, .2),
  200: const Color.fromRGBO(36, 44, 53, .3),
  300: const Color.fromRGBO(36, 44, 53, .4),
  400: const Color.fromRGBO(36, 44, 53, .5),
  500: const Color.fromRGBO(36, 44, 53, .6),
  600: const Color.fromRGBO(36, 44, 53, .7),
  700: const Color.fromRGBO(36, 44, 53, .8),
  800: const Color.fromRGBO(36, 44, 53, .9),
  900: const Color.fromRGBO(36, 44, 53, 1),
};
