import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:infoware/Home/home_screen.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    setupAudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void setupAudioPlayer() {
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: SweepGradient(
          colors: [
            Color.fromARGB(255, 24, 24, 24),
            Color.fromARGB(255, 106, 1, 1)
          ],
          stops: [0, 1],
          center: Alignment.topLeft,
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/pas.jpeg'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Pasoori',
                style: styleWidget.headerBoldTextStyle(),
              ),
              Text(
                "Coke Studio",
                style: styleWidget.textStyle(fontsize: 16, color: Colors.white),
              ),
              Slider(
                inactiveColor: Colors.white.withOpacity(0.5),
                activeColor: Colors.white,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await audioPlayer.seek(position);

                  await audioPlayer.resume();
                  // setState(() {
                  //   position = Duration(seconds: value.toInt());
                  // });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(position),
                      style: styleWidget.textStyle(
                          color: Colors.white.withOpacity(0.4)),
                    ),
                    Text(
                        formatTime(
                          duration - position,
                        ),
                        style: styleWidget.textStyle(
                            color: Colors.white.withOpacity(0.4))),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.red,
                  ),
                  iconSize: 40,
                  onPressed: () {
                    if (isPlaying) {
                      audioPlayer.pause();
                    } else {
                      playAudio("audio/Pasoori.mp3");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> playAudio(String assetPath) async {
    await audioPlayer.play(AssetSource(assetPath));
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
    ].join(":");
  }
}
