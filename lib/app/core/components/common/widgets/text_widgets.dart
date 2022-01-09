import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Text24B extends StatelessWidget {
  final String text;

  const Text24B({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aleo(fontSize: 24),
    );
  }
}
