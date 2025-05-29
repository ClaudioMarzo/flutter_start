import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/util/RouletteProvider.dart';

class ButtomCustom extends StatefulWidget {

  const ButtomCustom({ super.key });

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {

   @override
   Widget build(BuildContext context) {
    return Consumer<RouletteProvider>(
        builder: (_, provider, __) {
          return FloatingActionButton.extended(
            backgroundColor: const Color.fromARGB(255, 53, 5, 2),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onPressed: provider.isSpinning 
                ? null 
                : provider.spinRoulette,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: Text(
              provider.isSpinning ? "Girando..." : "Sortear",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      );
  }
}