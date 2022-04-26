import 'package:flutter/material.dart';

import 'package:flame/game.dart' show GameWidget, Game;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../Blocs/InventoryBloc.dart';

import '../States/InventoryState.dart';

class SetWidget1 extends StatelessWidget {
  const SetWidget1({required this.game, Key? key}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InventoryBloc(),
      child: GameWidget(game: game),
    );
  }
}
