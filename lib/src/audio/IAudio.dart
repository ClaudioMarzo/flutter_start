abstract interface class IAudio {
  void initAudio();
  void disposeAudio();
  Future<void> playSound();
  Future<void> stopSound();
}