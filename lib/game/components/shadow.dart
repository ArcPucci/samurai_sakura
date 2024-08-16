import 'dart:async';

import 'package:flame/components.dart';
import 'package:id_295/game/game.dart';

class PlayerShadow extends SpriteComponent with HasGameRef<MyGame> {
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    final newX = gameRef.size.x / 2 - AppConfig.shadowWidth / 2;
    final _y = gameRef.size.y / 1.48 +
        AppConfig.playerHeight -
        AppConfig.shadowHeight / 2;

    position = Vector2(newX, _y);
    sprite = await Sprite.load('shadow.png');
    size = Vector2(AppConfig.shadowWidth, AppConfig.shadowHeight);
  }

  void onUpdatePosition() {
    final _x = gameRef.player.x;
    final newX = _x - AppConfig.shadowWidth / 2;

    position = Vector2(newX, position.y);
  }
}
