import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../model/audiomodel.dart';



class SongDetail extends StatefulWidget {
  const SongDetail({super.key});

  @override
  State<SongDetail> createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  @override
  Widget build(BuildContext context) {
    AudioModel data = ModalRoute.of(context)!.settings.arguments as AudioModel;
    playAudio() {
      assetsAudioPlayer.open(Audio(data.audio));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<Object>(
          stream: assetsAudioPlayer.currentPosition,
          builder: (context, snapshot) {
            Duration? duration = snapshot.data as Duration?;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(18),
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          data.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    "${data.title}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${duration?.inMinutes}:${duration?.inSeconds}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.toggleLoop();
                      },
                      icon: Icon(
                        Icons.loop,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.previous(
                          keepLoopMode: true,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        playAudio();
                        assetsAudioPlayer.playOrPause();
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.pause();
                      },
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        assetsAudioPlayer.shuffle;
                      },
                      icon: Icon(
                        Icons.subscript,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}