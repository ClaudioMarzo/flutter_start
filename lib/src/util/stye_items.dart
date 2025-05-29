import 'package:flutter/material.dart';

Color getRandomColor(int index) {
  List<Color> colors = [
    const Color.fromARGB(255, 153, 10, 0),
    const Color.fromARGB(255, 0, 145, 5),
    const Color.fromARGB(255, 133, 80, 0),
    const Color.fromARGB(255, 0, 91, 165),
    const Color.fromARGB(255, 0, 145, 5),
    const Color.fromARGB(255, 133, 80, 0),
    const Color.fromARGB(255, 0, 91, 165),
  ];
  return colors[index] ;
}