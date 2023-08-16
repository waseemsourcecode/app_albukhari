import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(text,
        style: GoogleFonts.dancingScript(
            textStyle: TextStyle(
                fontSize: size.width * 0.07, fontWeight: FontWeight.w800)));
  }
}
