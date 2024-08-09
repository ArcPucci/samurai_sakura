import 'dart:async';

import 'package:flame/components.dart';
import 'package:id_295/game/game.dart';

class PlayerShadow extends SpriteComponent with HasGameRef<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final newX = gameRef.size.x / 2 - shadowWidth / 2;
    final _y = gameRef.size.y / 1.48 + playerHeight - shadowHeight / 2;

    position = Vector2(newX, _y);
    sprite = await Sprite.load('shadow.png');
    size = Vector2(shadowWidth, shadowHeight);
  }

  void onUpdatePosition() {
    final _x = gameRef.player.x;
    final newX = _x - shadowWidth / 2;

    position = Vector2(newX, position.y);
  }
}
