import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

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
              child: Container(color: Colors.black.withOpacity(0.2),),
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
                  const Text('Koisk', style: TextStyle(color: Colors.white , fontWeight: FontWeight.w700) ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text('Eshghe Sorat', style: TextStyle(color: Colors.white)),
                  const SizedBox(
                    height: 4,
                  ),
                  Slider(
                      value: 0.5,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white54,
                      onChanged:(value){

                  } ) ,
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('00:00',
                          style: TextStyle(color: Colors.white)),
                      Text('10:54',
                          style: TextStyle(color: Colors.white)),
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
                          onPressed: () {},
                          iconSize: 56,
                          icon: Icon(
                            true
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

