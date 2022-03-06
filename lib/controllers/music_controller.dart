import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:get/get.dart';
import 'dart:html' as html;

class MusicController extends GetxController {
  final music = AssetsAudioPlayer();
  var isPlay = true.obs;

  @override
  void onInit() {
    super.onInit();
    music.open(
      Audio.file("assets/musics/backsound1.mp3"),
    );
  }

  @override
  void dispose() {
    super.dispose();
    music.dispose();
  }

  void musicPlay() {
    isPlay.toggle();

    if (isPlay.value == false) {
      music.pause();
    } else {
      music.play();
    }
  }
}
