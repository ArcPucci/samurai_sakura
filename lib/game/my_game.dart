import 'dart:async';

import 'package:flame/game.dart';
import 'package:id_295/game/game.dart';

class MyGame extends FlameGame {
  late Player player;
  late PlayerShadow playerShadow;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    playerShadow = PlayerShadow();
    player = Player(position: Vector2(size.x / 2, size.y / 1.48));

    add(playerShadow);
    add(player);

    overlays.add('game_overlay');
  }
}
