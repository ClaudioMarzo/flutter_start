import 'package:flutter/material.dart';

Widget logoWithEffects(String imagePath) {
  return Container(
    height: 120,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: PhysicalModel(
      color: Colors.transparent,
      elevation: 2,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(// controla a altura geral da imagem
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight, // mantém proporção e altura
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    ),
  );
}
