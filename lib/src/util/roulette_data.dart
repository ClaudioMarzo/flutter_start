import 'dart:math';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:expo_tech_roleta/src/audio/audio.dart';
import 'package:expo_tech_roleta/src/util/list_opcions.dart';

class RouletteData {
  final List<String> items;
  final int? selectedIndex; 
  final bool isSpinning;
  final String selectedItem;

  RouletteData({
    required this.items,
    this.selectedIndex, 
    this.isSpinning = false,
    this.selectedItem = "",
  });

  RouletteData copyWith({
    List<String>? items,
    int? selectedIndex,
    bool? isSpinning,
    String? selectedItem,
  }) {
    return RouletteData(
      items: items ?? this.items,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isSpinning: isSpinning ?? this.isSpinning,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }
}

class RouletteController {
  final ValueNotifier<RouletteData> state;
  late final Audio audioPlayer;
  
  // Controller para o stream da roleta
  final _fortuneController = StreamController<int>.broadcast();
  Stream<int> get fortuneStream => _fortuneController.stream;


  RouletteController() : state = ValueNotifier(
    RouletteData(
      items: ListOpcions.getOpcions(),
      selectedIndex: null,
      isSpinning: false,
    )
  ) {
    audioPlayer = Audio();
    audioPlayer.initAudio();
  }

  void spinRoulette() {
    if (state.value.isSpinning) return;
    
    final items = state.value.items;
    final randomIndex = Random().nextInt(items.length);
    
    state.value = state.value.copyWith(
      selectedIndex: randomIndex,
      isSpinning: true,
      selectedItem: items[randomIndex],
    );
    
    _fortuneController.add(randomIndex);
    audioPlayer.playSound();
  }
  
  void onAnimationStart() {
    state.value = state.value.copyWith(isSpinning: true);
  }
  
  void onAnimationEnd() {
    state.value = state.value.copyWith(isSpinning: false);
    audioPlayer.stopSound();
  }
  
  void dispose() {
    audioPlayer.disposeAudio();
    state.dispose();
    _fortuneController.close();
  }
}