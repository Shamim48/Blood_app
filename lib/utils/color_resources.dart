
import 'package:blood_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorResources {


  static Color getPrimaryColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffB88A01) : Color(0xffB89018);
  }
  static Color getDrawerIconColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFF4F7FC) : Color(0xffB88A01);
  }

  static Color getGreyColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF6f7275) : Color(0xFFA0A4A8);
  }
  static Color getGrayColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF919191) : Color(0xFF6E6E6E);
  }
  static Color getSearchBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF585a5c) : Color(0xFFF4F7FC);
  }
  static Color getBackgroundColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF343636) : Color(0xFFF4F7FC);
  }

  static Color getNotificationRowBackgroundColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffD3D3D3) : Color(0xFF2D2E2D);
  }

  static Color getBackground2Color(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff25282B) : Color(0xffE6E6E6);
  }
  static Color getHintColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFF98a1ab) : Color(0xFF808080);
  }

  static Color getSemilerColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffF9F9F9) : Color(0xffE6E6E6);
  }
  static Color getTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xffFFFFFF) : Color(0xff000000);
  }
   static Color getTextColorReverse(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xff000000) : Color(0xffFFFFFF);
  }

  static Color getGreyBunkerColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme ? Color(0xFFE4E8EC) : Color(0xFF25282B);
  }
  static const Color BLACK = Color(0xff000000);
  static const Color TEXT_FIELD_BG = Color(0xffD2D2D2);
  static const Color WHITE = Color(0xffFFFFFF);
  static const Color COLOR_GOLD = Color(0xffB89018);
  static const Color COLOR_PRIMARY = Color(0xffa30e11);
  static const Color COLOR_BLUE = Color(0xff00ADE3);
  static const Color COLUMBIA_BLUE = Color(0xff00ADE3);
  static const Color LIGHT_SKY_BLUE = Color(0xff8DBFF6);
  static const Color HARLEQUIN = Color(0xff3FCC01);
  static const Color CERISE = Color(0xffE2206B);
  static const Color GREY = Color(0xffF1F1F1);
  static const Color RED = Color(0xFFD32F2F);
  static const Color YELLOW = Color(0xFFFFAA47);
  static const Color HINT_TEXT_COLOR = Color(0xff9E9E9E);
  static const Color GAINS_BORO = Color(0xffE6E6E6);
  static const Color TEXT_BG = Color(0xffF3F9FF);
  static const Color GREEN = Color(0xff23CB60);
  static const Color FLOATING_BTN = Color(0xff7DB6F5);



  static const Color Screen_top_color = Color(0xff6A82FE);
  static const Color Screen_midle_color = Color(0xff877CFE);
  static const Color Screen_buttom_color = Color(0xffA076FE);
  static const Color Border_color = Color(0xff546ADF);

  static const Map<int, Color> colorMap = {
    50: Color(0x10B89018),
    100: Color(0x20B89018),
    200: Color(0x30B89018),
    300: Color(0x40B89018),
    400: Color(0x50B89018),
    500: Color(0x60B89018),
    600: Color(0x70B89018),
    700: Color(0x80B89018),
    800: Color(0x90B89018),
    900: Color(0xffB89018),
  };

}
