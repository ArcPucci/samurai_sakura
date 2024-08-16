import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:id_295/game/game.dart';

class RectangleTest extends RectangleComponent with HasGameRef<MyGame> {
  RectangleTest({
    required this.posX,
    required this.fallingItem,
    required double topPadding,
  }) : super(
          size: fallingItem.size,
          position: Vector2(posX, AppConfig.startPosY),
          anchor: Anchor.center,
        );

  bool divided = false;

  final FallingItem fallingItem;
  final double posX;

  Vector2 velocity = Vector2(0, 250);

  @override
  void update(double dt) {
    super.update(dt);

    if (position.y > gameRef.size.y / 2) return;

    position +=
        Vector2(0, (velocity.y * dt - .5 * AppConfig.gravity * dt * dt));

    if (position.y <= gameRef.size.y / 2) return;

    findGame()?.addAll({
      RectangleComponent(
        size: Vector2(size.x, size.y / 2),
        position: center -
            Vector2(size.x / 2 * cos(pi / 2), size.x / 2 * sin(pi / 2)),
        anchor: Anchor.topLeft,
        angle: pi / 2,
        paint: Paint()..color = Colors.red,
      ),
      RectangleComponent(
        size: Vector2(size.x, size.y / 2),
        angle: pi / 2,
        position: center +
            Vector2(size.x / 4 * cos(pi / 2 + 3 * pi / 2),
                size.x / 4 * sin(pi / 2 + 3 * pi / 2)),
        anchor: Anchor.center,
        paint: Paint()..color = Colors.blue,
      ),
    });

    removeFromParent();
  }
}
