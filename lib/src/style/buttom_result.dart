import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/util/roulette_data.dart';

class ButtomResult extends StatelessWidget {
  const ButtomResult({ super.key });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RouletteController>(context, listen: false);

    return ValueListenableBuilder<RouletteData>(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return Container(
          margin: const EdgeInsets.only(top: 30.0),
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 100.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 53, 5, 2), Color.fromARGB(255, 53, 5, 2),],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8.0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              state.isSpinning ?
              const Text(
                "Aguardando sorteio..." ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ) :
              Text(
                "Resultado : ${state.selectedItem.toUpperCase()}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}