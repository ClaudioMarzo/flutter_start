import 'package:flutter/material.dart';

Color getRandomColor(int index) {
  List<Color> colors = [
    const Color.fromARGB(255, 214, 14, 0),
    const Color.fromARGB(255, 0, 201, 7),
    const Color.fromARGB(255, 186, 112, 0),
    const Color.fromARGB(255, 0, 112, 203),
    const Color.fromARGB(255, 214, 14, 0),
    const Color.fromARGB(255, 0, 201, 7),
    const Color.fromARGB(255, 186, 112, 0),
    const Color.fromARGB(255, 0, 112, 203),
  ];
  return colors[index] ;
}