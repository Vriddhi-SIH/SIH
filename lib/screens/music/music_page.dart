import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/screens/mental_health/mental_health.dart';

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
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            // Image(
            //   image: AssetImage('assets/images/yoga.png'),
            // ),
            Slider(
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
                  Text(formatTime(duration)),
                  Text(formatTime(duration - position)),
                ],
              ),
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
                    child: isPlaying
                        ? Icon(
                            Icons.pause,
                          )
                        : Icon(Icons.play_arrow)))
          ],
        )),
      ),
    );
  }
}
