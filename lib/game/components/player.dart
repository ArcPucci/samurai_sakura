import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

import '../game.dart';

enum PlayerDirection { left, right, none }

class Player extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  Player({super.position});

  final hitBox = RectangleHitbox();

  PlayerDirection _playerDirection = PlayerDirection.none;
  bool _facingRight = true;

  final Vector2 _velocity = Vector2.zero();
  double moveSpeed = 500;

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    sprite = await Sprite.load('samurai.png');
    size = Vector2(AppConfig.playerWidth, AppConfig.playerHeight);
    anchor = Anchor.topCenter;
    await add(hitBox);
  }

  @override
  void update(double dt) {
    _updatePlayerMovement(dt);
    super.update(dt);
  }

  void onGoLeft() {
    if (_playerDirection == PlayerDirection.left) return;
    _playerDirection = PlayerDirection.left;
  }

  void onGoRight() {
    if (_playerDirection == PlayerDirection.right) return;
    _playerDirection = PlayerDirection.right;
  }

  void onCancel() {
    _playerDirection = PlayerDirection.none;
  }

  void onTap(PlayerDirection playerDirection) async {
    _playerDirection = playerDirection;

    await Future.delayed(const Duration(milliseconds: 100));
    _playerDirection = PlayerDirection.none;
  }

  void _updatePlayerMovement(double dt) {
    double dirX = 0;
    switch (_playerDirection) {
      case PlayerDirection.left:
        if (position.x <= AppConfig.playerWidth / 2) return;
        if (_facingRight) {
          flipHorizontallyAroundCenter();
          _facingRight = false;
        }
        dirX -= moveSpeed;
        break;
      case PlayerDirection.right:
        if (position.x > gameRef.size.x - AppConfig.playerWidth / 2) return;
        if (!_facingRight) {
          flipHorizontallyAroundCenter();
          _facingRight = true;
        }
        dirX += moveSpeed;
        break;
      case PlayerDirection.none:
        break;
    }

    _velocity.x = dirX;
    position += _velocity * dt;

    gameRef.playerShadow.onUpdatePosition();
  }
}
