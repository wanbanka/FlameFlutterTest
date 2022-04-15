import 'dart:ui' as Ui;

import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;

import '../Controllers/FlameController.dart';

import '../Components/Sprites/Cat.dart';

import '../Components/Parallax/MyParallax.dart';
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
    return FutureBuilder<Map<String, Ui.Image>>(
        future: flameCon.loadSeveralPictures({
          "MarioNormal": "Mario_normal.png",
          "MarioApeure": "Mario_apeure.png",
          "ButtonANormal": "ButtonANormal.png",
          "ButtonAPressed": "ButtonAPressed.png",
          "Background": "BGGame.png",
          "Gate": "Gate.png",
          "Ball": "Ball.png",
          "Tileset": "tileset.png",
          "Cat": "Cat_Idle.png",
          "CatAttack": "Cat_Attack.png",
          "CatDeath": "Cat_Death.png",
          "CatHurt": "Cat_Hurt.png",
          "CatWalk": "Cat_Walk.png",
        }),
        builder: (context, snapshot) {
          print("Snapshot: ${snapshot.data}");

          if (snapshot.hasData) {
            var data = snapshot.data!;

            print(data["CatWalk"]!);

            myGame = MyGame(sprites: [
              Cat(spriteSheet: {
                CatStatus.normal: {"image": data["Cat"]!, "nb_sprites": 4},
                CatStatus.attack: {
                  "image": data["CatAttack"]!,
                  "nb_sprites": 4
                },
                CatStatus.hurt: {"image": data["CatHurt"]!, "nb_sprites": 2},
                CatStatus.death: {
                  "image": data["CatDeath"]!,
                  "nb_sprites": 4,
                  "step_time": 0.8
                },
                CatStatus.walk: {"image": data["CatWalk"]!, "nb_sprites": 5}
              }, widthCat: 48, heightCat: 48)
            ], parallax: [
              MyParallax(elements: [data["Background"]!, data["Gate"]!])
            ], shapes: [], tilesets: []);
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
