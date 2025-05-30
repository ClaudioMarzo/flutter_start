import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorTitle extends StatelessWidget {
  const ColorTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Título principal com cores e sombras
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.pressStart2p(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              shadows: [
                const Shadow(
                  color: Colors.black87,
                  offset: Offset(2, 2),
                  blurRadius: 3,
                ),
              ],
            ),
            children: const [
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
            ],
          ),
        ),
        
        // Subtítulo "da Sorte!!" com efeito brilhante
        Container(
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.shade700,
                Colors.amber.shade300,
                Colors.amber.shade700,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(0x88000000),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            "da Sorte!!",
            textAlign: TextAlign.center,
            style: GoogleFonts.pressStart2p(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              shadows: const [
                Shadow(
                  color: Colors.black87,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}