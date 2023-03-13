import 'package:flame_audio/flame_audio.dart';

class SoundHelper {
  Future initialize() async {
    await FlameAudio.audioCache.loadAll([
      'Error.mp3',
      'Correct.mp3',
      'End.mp3',
      'Click.mp3',
    ]);
  }

  void right() {
    FlameAudio.play('Correct.mp3', volume: 0.5);
  }

  void wrong() {
    FlameAudio.play('Error.mp3', volume: 0.5);
  }

  void levelend() {
    FlameAudio.play('End.mp3', volume: 0.5);
  }

  void clickbutton() {
    FlameAudio.play('Click.mp3', volume: 0.5);
  }

}
