import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/main.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late MyGame _game;

  @override
  void initState() {
    super.initState();
    _game = MyGame(
      topPadding: topPadding,
      preferencesService: Provider.of(context, listen: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: _game,
      overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
        "game_overlay": (context, game) => GameOverlay(game),
        "instructions1": (context, game) => Instructions1Overlay(game),
        "instructions2": (context, game) => Instructions2Overlay(game),
        "results": (context, game) => ResultsOverlay(game),
        "warning": (context, game) => WarningOverlay(game),
      },
      backgroundBuilder: (context) => Image.asset(
        'assets/items/bg.png',
        width: 375.w,
        height: 812.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
