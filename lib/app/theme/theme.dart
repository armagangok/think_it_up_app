import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_it_up_app/app/theme/colors.dart';

class CustomTheme {
  final ligthTheme =
      ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
    // textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    // scaffoldBackgroundColor: Colors.blue[100],
    // cardColor: Colors.orange[100],
    // dividerColor: Colors.black,
    // dividerTheme: DividerThemeData(thickness: 0.2),
    // textButtonTheme: TextButtonThemeData(
    //   style: ButtonStyle(
    //       // backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[200]!),
    //       // foregroundColor: MaterialStateProperty.all<Color>(Colors.red[600]!),
    //       ),
    // ),
    // iconTheme: IconThemeData(color: Colors.purple),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: const BorderSide(
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(90.0),
        borderSide: const BorderSide(),
      ),
      filled: true,
      fillColor: Colors.grey[300],
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    cardColor: Colors.grey[300],
    dividerColor: Colors.black,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: Colors.grey[100],
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        pickerTextStyle: TextStyle(color: Colors.black),
      ),
    ),
  );

  final darkTheme =
      ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    dividerColor: Colors.white,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: CustomColor().bgColor,

    /** INPUT DECOR THEME*/
    inputDecorationTheme: InputDecorationTheme(
      fillColor: CustomColor().textField,
      filled: true,
      labelStyle: const TextStyle(fontSize: 13),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: CustomColor().textField,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: CustomColor().textField,
        ),
      ),
    ),

    /** ELEVATED BUTTON THEME */
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(CustomColor().mainColor),
      ),
    ),

    /** CUPERTINO THEME */
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        pickerTextStyle: TextStyle(color: Colors.white),
      ),
    ),

    /**TEXT THEME */
    textTheme: TextTheme(
      caption: GoogleFonts.lato(fontSize: 24, color: Colors.white),
      bodyText1: GoogleFonts.lato(fontSize: 14, color: Colors.white),
      bodyText2: GoogleFonts.lato(fontSize: 16, color: Colors.white),
    ),
  );
}
