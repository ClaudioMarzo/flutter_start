import 'dart:async';

import 'package:expo_tech_roleta/src/style/buttom_custom.dart';
import 'package:expo_tech_roleta/src/style/buttom_result.dart';
import 'package:expo_tech_roleta/src/util/list_opcions.dart';
import 'package:expo_tech_roleta/src/util/roulette_state.dart';
import 'package:expo_tech_roleta/src/util/stye_items.dart';
import 'package:expo_tech_roleta/src/util/style_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';

class Roulette extends StatefulWidget {

  const Roulette({ super.key });

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  late List<String> items = ListOpcions.getOpcions();
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, 
        backgroundColor: const Color.fromARGB(255, 53, 5, 2),
        centerTitle: true,
        title: const ColorTitle()
      ),
      body:  Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<RouletteState>(
          builder: (context, provider, _) {
            return Column(
              children: [
                Expanded(
                  child: FortuneWheel(
                    duration: const Duration(seconds: 11),
                    onAnimationStart: () => provider.onAnimationStart(),
                    onAnimationEnd: () => provider.onAnimationEnd(),
                    selected: provider.selected.stream,
                    items: [
                      for (var i = 0; i < provider.items.length; i++)
                        FortuneItem(
                          style: FortuneItemStyle(
                            color: getRandomColor(i),
                            borderWidth: 2,
                            borderColor: Colors.white,
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          child: Text(provider.items[i]),
                        ),
                    ],
                  ),
                ),
                const ButtomResult(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: const ButtomCustom(),
    );
  }
}