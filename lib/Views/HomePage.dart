import 'dart:ui' as Ui;

import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;

import '../Controllers/FlameController.dart';

import '../Components/Sprites/MyCrate.dart';
import '../Components/Sprites/Mario.dart';

import '../Components/Positions/Position1.dart';

import '../Components/Games/MyGame.dart';
import '../Components/GameWidgets/SetWidget1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  _HomePageState() : super(FlameController()) {
    flameCon = controller as FlameController;
  }

  late FlameController flameCon;

  late MyGame myGame;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ui.Image>>(
        future: flameCon
            .loadSeveralPictures(["Mario_normal.png", "Mario_apeure.png"]),
        builder: (context, snapshot) {
          print("Snapshot: ${snapshot.data}");

          if (snapshot.hasData) {
            myGame = MyGame(sprites: [
              Mario(
                  spriteSheet: snapshot.data!,
                  onDragAudio: () async {
                    List<String> audios = ["DOH.mp3", "WAA.mp3", "MAMA.mp3"];

                    await this.flameCon.randomAudio(audios);
                  })
            ]);
          }

          return Scaffold(
            body: Center(
                child: snapshot.hasData
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SetWidget1(game: myGame),
                      )
                    : CircularProgressIndicator()),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: snapshot.hasData
                  ? [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          onPressed: () {
                            myGame.paused = !myGame.paused;
                          },
                          tooltip: 'Increment',
                          child: myGame.paused
                              ? const Icon(Icons.play_arrow)
                              : const Icon(Icons.pause),
                        ),
                      ),
                    ]
                  : [],
            ),
          );
        });
  }
}
