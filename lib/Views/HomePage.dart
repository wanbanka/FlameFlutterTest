import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart' show StateMVC;

import '../Controllers/FlameController.dart';

import '../Components/Sprites/MyCrate.dart';
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

  MyGame myGame = MyGame(sprites: [MyCrate(), Position1()]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SetWidget1(game: myGame),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  myGame.paused = !myGame.paused;
                });
              },
              tooltip: 'Increment',
              child: myGame.paused
                  ? const Icon(Icons.play_arrow)
                  : const Icon(Icons.pause),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                (myGame.sprites.first as MyCrate).walk(forward: false, x: 1);
              },
              onLongPress: () {
                (myGame.sprites.first as MyCrate).walk(forward: false, x: 1);
              },
              child: Icon(Icons.arrow_left),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                (myGame.sprites.first as MyCrate).walk(forward: true, x: 1);
              },
              onLongPress: () {
                (myGame.sprites.first as MyCrate).walk(forward: true, x: 1);
              },
              child: Icon(Icons.arrow_right),
            ),
          )
        ],
      ),
    );
  }
}
