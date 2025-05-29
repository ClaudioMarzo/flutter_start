import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTitle extends StatelessWidget {
  const ColorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final baseStyle = GoogleFonts.pressStart2p(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: baseStyle,
        children: const  [
          TextSpan(text: '<', style: TextStyle(color: Colors.blue)),
          TextSpan(text: 'E', style: TextStyle(color: Colors.blue)),
          TextSpan(text: 'x', style: TextStyle(color: Colors.red)),
          TextSpan(text: 'p', style: TextStyle(color: Colors.yellow)),
          TextSpan(text: 'o', style: TextStyle(color: Colors.green)),
          TextSpan(text: '-', style: TextStyle(color: Colors.green)),
          TextSpan(text: 'T', style: TextStyle(color: Colors.blue)),
          TextSpan(text: 'e', style: TextStyle(color: Colors.red)),
          TextSpan(text: 'c', style: TextStyle(color: Colors.yellow)),
          TextSpan(text: 'h', style: TextStyle(color: Colors.green)),
          TextSpan(text: '>', style: TextStyle(color: Colors.blue)),
          TextSpan(text: ' da Sorte!!', style: TextStyle(color: Colors.amber)),
        ],
      ),
    );
  }
}