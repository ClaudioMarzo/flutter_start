
import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:expo_tech_roleta/src/util/list_opcions.dart';
import 'package:flutter/foundation.dart';

class RouletteState extends ChangeNotifier {
  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;
  final List<String> items = ListOpcions.getOpcions();
  final StreamController<int> selected = StreamController<int>.broadcast();
  int? currentIndex;
  bool _isSpinning = false;

  bool get isSpinning => _isSpinning;
  
  set isSpinning(bool value) {
    _isSpinning = value;
    if (_isSpinning) {
      _playSpinSound();
    } else {
      _stopSpinSound();
    }
    notifyListeners();
  }

  RouletteState() {
    _audioPlayer = AudioPlayer();
    _audioCache = AudioCache(prefix: 'assets/sounds/');
    _audioCache.load('spin_sound.mp3');
    // Para capturar o resultado selecionado
    selected.stream.listen((index) {
      currentIndex = index;
      isSpinning = true;
      notifyListeners();
    });
  }

  Future<void> _playSpinSound() async {
    try {
      await _audioPlayer.stop(); // Stop any previous playback
      await _audioPlayer.play(AssetSource('sounds/rodaroda.mp3'));
    } catch (e) {
      if (kDebugMode) {
        print('Error playing sound: $e');
      }
    }
  }

  Future<void> _stopSpinSound() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      if (kDebugMode) {
        print('Error stopping sound: $e');
      }
    }
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