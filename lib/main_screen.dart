import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/extentions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final AudioPlayer audioPlayer = AudioPlayer();
  Duration? duration;
  Timer? timer ;

  @override
  void initState() {
    audioPlayer.setAsset('assets/music.mp3').then((value) {
      duration = value;
      audioPlayer.play();

      timer = Timer.periodic(Duration(microseconds: 200), (timer) {
        setState(() {
          if(audioPlayer.position.inMilliseconds > duration!.inMilliseconds.toDouble()-100){
            audioPlayer.seek(const Duration(milliseconds:0)) ;
          }
        });
      });

      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: ExactAssetImage('assets/cover.jpg'))),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          )),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(54),
                          child: Image.asset(
                            'assets/shark.jpg',
                            width: 54,
                            height: 54,
                            fit: BoxFit.fill,
                          )),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        'Sharky',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Image.asset('assets/cover.jpg'),
                  )),
                  const Text('Koisk',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Eshghe Sorat',
                      style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 4,
                  ),
                  if(duration != null )
                    Slider(
                      activeColor: Colors.white,
                      inactiveColor: Colors.white54,
                      max: duration!.inMilliseconds.toDouble(),
                      value: audioPlayer.position.inMilliseconds.toDouble(),
                      onChangeStart: (value) {
                        audioPlayer.pause() ;
                      },
                        onChangeEnd: (value) {
                          audioPlayer.play() ;
                        },
                      onChanged: (value) {
                        audioPlayer.seek(Duration(milliseconds: value.toInt())) ;
                      }),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(audioPlayer.position.toMinutesSeconds(), style: TextStyle(color: Colors.white)),
                      Text(duration != null ?audioPlayer.duration!.toMinutesSeconds() : '00:00', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          iconSize: 32,
                          icon: const Icon(
                            CupertinoIcons.backward_fill,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {
                            if(audioPlayer.playing){
                              audioPlayer.pause() ;
                            }else{
                              audioPlayer.play() ;
                            }
                          },
                          iconSize: 56,
                          icon: Icon(
                            audioPlayer.playing
                                ? CupertinoIcons.pause_circle_fill
                                : CupertinoIcons.play_circle_fill,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          iconSize: 32,
                          icon: const Icon(
                            CupertinoIcons.forward_fill,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
