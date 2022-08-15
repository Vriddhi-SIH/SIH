// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPlaying2 = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuraion) {
      setState(() {
        duration = newDuraion;
      });
    });
    audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await audioPlayer.dispose();
        Navigator.pop(context);
        return Future.delayed(Duration(microseconds: 5));
      },
      child: Material(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
              child: Container(
            height: 500,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(28),
                color: Colors.grey[200]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/music_player_image.png'),
                  height: 250,
                  width: 250,
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                    onTap: () async {
                      if (isPlaying2) {
                        await Future.delayed(Duration(microseconds: 1));
                        setState(() {
                          isPlaying2 = false;
                        });
                      } else if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        setState(() {
                          isPlaying2 = true;
                        });
                        String url =
                            "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3";

                        await audioPlayer.play(UrlSource(url));
                      }
                    },
                    child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(255, 100, 100, 1),
                        foregroundColor: Colors.grey[200],
                        maxRadius: 35,
                        child: isPlaying
                            ? Icon(
                                Icons.pause,
                                size: 35,
                              )
                            : Icon(
                                Icons.play_arrow,
                                size: 35,
                              ))),
                Slider(
                    thumbColor: Color.fromRGBO(255, 100, 100, 1),
                    inactiveColor: Colors.grey[500],
                    activeColor: Color.fromRGBO(255, 100, 100, 1),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    }),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text(formatTime(position)),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        child: Text(formatTime(duration)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
