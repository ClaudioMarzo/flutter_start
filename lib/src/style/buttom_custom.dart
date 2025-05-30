import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/util/roulette_data.dart';

class ButtomCustom extends StatefulWidget {
  const ButtomCustom({super.key});

  @override
  State<ButtomCustom> createState() => _ButtomCustomState();
}

class _ButtomCustomState extends State<ButtomCustom> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RouletteController>(context, listen: false);

    return ValueListenableBuilder<RouletteData>(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 53, 5, 2),
          
          elevation: 15.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: state.isSpinning 
              ? null 
              : controller.spinRoulette,
          icon: const Icon(Icons.refresh, color: Colors.white, size: 32,),
          label: Text(
            state.isSpinning ? "Girando..." : "Sortear",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        );
      },
    );
  }
}