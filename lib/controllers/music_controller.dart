import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';

class MusicController extends GetxController {
  final AssetsAudioPlayer music = AssetsAudioPlayer();
  var isPlay = false.obs;

  @override
  void onInit() {
    super.onInit();
    music.open(
      Audio.file("assets/musics/backsound1.mp3"),
      loopMode: LoopMode.single,
      playInBackground: PlayInBackground.enabled,
    );

    playMusic();
  }

  @override
  void dispose() {
    super.dispose();
    music.dispose();
  }

  void musicPlay() {
    isPlay.toggle();

    if (isPlay.value) {
      stopMusic();
    } else {
      playMusic();
    }
  }

  playMusic() {
    music.play();
  }

  stopMusic() {
    music.stop();
  }
}
