import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static Color primaryColor=Color(0xFFB7935F);
  static Color primaryDarkColor=Color(0xFF141A2E);
  static Color balckColor=Color(0xFF242424);
  static Color goldColor=Color(0xFFFACC1D);

  static ThemeData lightTheme=ThemeData(
    dividerTheme: DividerThemeData(
      color: primaryColor
    ),
    primaryColor: primaryColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: balckColor,
      unselectedItemColor: Colors.white,

    ),
    scaffoldBackgroundColor:Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.black
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700, fontSize: 30),
      bodyMedium:   GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700, fontSize: 25),
      bodySmall:   GoogleFonts.elMessiri(
      fontWeight: FontWeight.w700, fontSize: 20),
    ),
  );
  static ThemeData darkTheme=ThemeData(
    dividerTheme: DividerThemeData(
        color: goldColor,
    ),
    primaryColor: primaryDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryDarkColor,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: goldColor,
      unselectedItemColor: Colors.white,

    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        size: 30,
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w400,
        fontSize: 25,
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w700, fontSize: 30,color: Colors.white),
      bodyMedium:   GoogleFonts.elMessiri(
          fontWeight: FontWeight.w700, fontSize: 25,color:goldColor),
      bodySmall:   GoogleFonts.elMessiri(
          fontWeight: FontWeight.w700, fontSize: 20,color: Colors.white),
    ),
  );
}