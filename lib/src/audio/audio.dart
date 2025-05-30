import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:expo_tech_roleta/src/audio/IAudio.dart';

class Audio implements IAudio{
  late final AudioPlayer _audioPlayer;
  
  @override
  void initAudio() {
    _audioPlayer = AudioPlayer(); 
    AudioCache(prefix: 'assets/sounds/').loadAll(['spin_sound.mp3', 'rodaroda.mp3']);
  }

  @override
  void disposeAudio() {
    _audioPlayer.dispose();
  }

  @override
  Future<void> playSound() async {
    try {
      await _audioPlayer.stop();
      await _audioPlayer.play(AssetSource('sounds/rodaroda.mp3'));
    } catch (e) {
      if (kDebugMode) {
        print('Error playing sound: $e');
      }
    }
  }

  @override
  Future<void> stopSound() async{
    try {
      await _audioPlayer.stop();
    } catch (e) {
      if (kDebugMode) {
        print('Error stopping sound: $e');
      }
    }
  }
  
}