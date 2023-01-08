
import 'package:flutter/material.dart';
ThemeData light = ThemeData(
  fontFamily: 'Lato',
  primaryColor: Color(0xffB89018),
  brightness: Brightness.light,
  focusColor: Color(0xFFADC4C8),
  hintColor: Color(0xFF52575C),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);