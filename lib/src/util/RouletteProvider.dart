import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:expo_tech_roleta/src/util/list_opcions.dart';

class RouletteProvider extends ChangeNotifier {
  final List<String> items = ListOpcions.getOpcions();
  final StreamController<int> selected = StreamController<int>.broadcast();
  int? currentIndex;
  bool isSpinning = false;
  
  RouletteProvider() {
    // Para capturar o resultado selecionado
    selected.stream.listen((index) {
      currentIndex = index;
      isSpinning = true;
      notifyListeners();
    });
  }
  
  void spinRoulette() {
    if (isSpinning) return; // Evita múltiplos giros simultâneos
    
    final randomIndex = Random().nextInt(items.length);
    selected.add(randomIndex);
    notifyListeners();
  }
  
  void onAnimationStart() {
    isSpinning = true;
    notifyListeners();
  }
  
  void onAnimationEnd() {
    isSpinning = false;
    notifyListeners();
  }
  
  String? get selectedItem {
    return currentIndex != null ? items[currentIndex!] : null;
  }
  
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }
}