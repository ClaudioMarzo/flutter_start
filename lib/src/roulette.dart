import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expo_tech_roleta/src/style/stye_items.dart';
import 'package:expo_tech_roleta/src/style/style_title.dart';
import 'package:expo_tech_roleta/src/util/roulette_data.dart';
import 'package:expo_tech_roleta/src/style/buttom_result.dart';
import 'package:expo_tech_roleta/src/style/buttom_custom.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Roulette extends StatefulWidget {
  const Roulette({ super.key });

  @override
  State<Roulette> createState() => _RouletteState();
}

class _RouletteState extends State<Roulette> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RouletteController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120, 
        backgroundColor: const Color.fromARGB(255, 53, 5, 2),
        centerTitle: true,
        // leading: Builder(
        //   builder: (context) {
        //     return Container(
        //       padding: const EdgeInsets.only(left: 40),
        //       alignment: Alignment.topRight,
        //       child: logoWithEffects('assets/images/maues.png'),
        //     );
        //   },
        // ),
        title: const ColorTitle(),
        // actions: [
        //   logoWithEffects('assets/images/semed.png'),
        //   const SizedBox(width: 10),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<RouletteData>(
          valueListenable: controller.state,
          builder: (context, state, _) {
            return Column(
              children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(
                              width: 8.0,
                              // Gradiente será aplicado através do shader em vez desta cor
                              color: Colors.transparent,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 140, 255),
                              Color.fromARGB(255, 219, 15, 0),
                              Color.fromARGB(255, 255, 230, 0),
                              Color.fromARGB(255, 0, 255, 8),
                              Color.fromARGB(255, 0, 140, 255),
                            ],
                            // Você pode ajustar os stops para controlar a distribuição das cores
                            stops: [0.0, 0.25, 0.5, 0.75, 1.0],
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color.fromARGB(255, 74, 75, 7),
                              blurRadius: 15.0,
                              spreadRadius: 2.0,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(8.0), // Espaço para a borda
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.amber.withOpacity(0.3),
                                const Color.fromARGB(0, 68, 0, 255),
                              ],
                              stops: const [0.7, 1.0],
                            ),
                          ),
                          padding: const EdgeInsets.all(4.0),
                          child: FortuneWheel(
                            physics: NoPanPhysics(),
                            duration: const Duration(seconds: 12),
                            onAnimationStart: () => controller.onAnimationStart(),
                            onAnimationEnd: () => controller.onAnimationEnd(),
                            selected: controller.fortuneStream,
                            items: [
                              for (var i = 0; i < state.items.length; i++)
                                FortuneItem(
                                  style: FortuneItemStyle(
                                    color: getRandomColor(i),
                                    borderWidth: 4,
                                    borderColor: Colors.white,
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                  ),
                                  child: Text(state.items[i]),
                                ),
                            ],
                          ),
                        ),
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