import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../export/core_export.dart';

class CustomTheme {
  final darkTheme =
      ThemeData.from(colorScheme: const ColorScheme.dark()).copyWith(
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    dividerColor: Colors.white,
    dividerTheme: const DividerThemeData(thickness: 0.2),
    scaffoldBackgroundColor: kColor.bgColor,

    /** INPUT DECOR THEME*/
    inputDecorationTheme: InputDecorationTheme(
      fillColor: kColor.textField,
      filled: true,
      labelStyle: const TextStyle(fontSize: 13),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kColor.textField,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: kColor.textField,
        ),
      ),
    ),

    /** ELEVATED BUTTON THEME */
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(kColor.mainColor),
      ),
    ),

    /** ICON BUTTON THEME */

    /** CUPERTINO THEME */
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(
        pickerTextStyle: TextStyle(color: Colors.white),
      ),
    ),

    /**TEXT THEME */
    textTheme: TextTheme(
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w400,
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: 52,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 15,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      displayMedium: GoogleFonts.poppins(
        fontSize: 24,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      displaySmall: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 15,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 22,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w600,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 18,
        color: const Color.fromARGB(255, 204, 204, 204),
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
































  // final ligthTheme =
  //     ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
  //   // textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
  //   // scaffoldBackgroundColor: Colors.blue[100],
  //   // cardColor: Colors.orange[100],
  //   // dividerColor: Colors.black,
  //   // dividerTheme: DividerThemeData(thickness: 0.2),
  //   // textButtonTheme: TextButtonThemeData(
  //   //   style: ButtonStyle(
  //   //       // backgroundColor: MaterialStateProperty.all<Color>(Colors.orange[200]!),
  //   //       // foregroundColor: MaterialStateProperty.all<Color>(Colors.red[600]!),
  //   //       ),
  //   // ),
  //   // iconTheme: IconThemeData(color: Colors.purple),

  //   inputDecorationTheme: InputDecorationTheme(
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(90.0),
  //       borderSide: const BorderSide(
  //         width: 1,
  //       ),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(90.0),
  //       borderSide: const BorderSide(),
  //     ),
  //     filled: true,
  //     fillColor: Colors.grey[300],
  //     labelStyle: const TextStyle(color: Colors.black),
  //     border: const OutlineInputBorder(
  //       borderSide: BorderSide(color: Colors.black),
  //     ),
  //   ),
  //   cardColor: Colors.grey[300],
  //   dividerColor: Colors.black,
  //   dividerTheme: const DividerThemeData(thickness: 0.2),
  //   scaffoldBackgroundColor: Colors.grey[100],
  //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
  //     backgroundColor: Colors.blue,
  //   ),
  //   cupertinoOverrideTheme: const CupertinoThemeData(
  //     textTheme: CupertinoTextThemeData(
  //       pickerTextStyle: TextStyle(color: Colors.black),
  //     ),
  //   ),
  // );