import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/image_composition.dart' as composition;
import 'package:id_295/game/game.dart';

class FallingItem extends SpriteComponent
    with HasGameRef<MyGame>, CollisionCallbacks {
  FallingItem({
    required this.image,
    required this.path,
    required Vector2 initPos,
    required Vector2 size,
    this.divided = false,
    super.position,
    super.anchor,
  })  : _initPos = initPos,
        super(
          size: size,
          sprite: Sprite(image),
        );

  final composition.Image image;
  final String path;
  final Vector2 _initPos;
  final bool divided;

  final hitBox = RectangleHitbox();

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    position = _initPos;
    await add(hitBox);
  }

  Vector2 velocity = Vector2(0, 175);

  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.gameManager.gameState != GameState.playing) return;

    position += Vector2(
      0,
      (velocity.y * dt - .5 * AppConfig.gravity * dt * dt),
    );

    if (position.y < gameRef.size.y) return;

    if (path.contains('torch') && !divided) gameRef.gameManager.onFail();

    removeFromParent();
  }

  void onCut() async {
    if (!path.contains('torch')) {
      removeFromParent();
      return;
    }

    final dividedImage1 = composition.ImageComposition()
          ..add(
            image,
            Vector2(-10, 0),
            isAntiAlias: true,
            source: Rect.fromLTWH(
              0,
              0,
              image.width / 2,
              image.height.toDouble(),
            ),
          ),
        dividedImage2 = composition.ImageComposition()
          ..add(
            image,
            Vector2(10, 0),
            isAntiAlias: true,
            source: Rect.fromLTWH(
              image.width / 2,
              0,
              image.width / 2,
              image.height.toDouble(),
            ),
          );

    findGame()?.addAll({
      FallingItem(
        size: Vector2(size.x / 2, size.y),
        anchor: Anchor.center,
        image: dividedImage1.composeSync(),
        path: path,
        divided: true,
        initPos: center - Vector2(size.x / 4, 0),
      )..onRemove(),
      FallingItem(
        size: Vector2(size.x / 2, size.y),
        anchor: Anchor.center,
        path: path,
        divided: true,
        image: dividedImage2.composeSync(),
        initPos: center + Vector2(size.x / 4, 0),
      )..onRemove(),
    });

    removeFromParent();
  }

  Future<void> onRemove() async {
    await Future.delayed(Duration(milliseconds: 300));
    removeFromParent();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (divided) return;
    if (other is! Player) return;

    if (path.contains('torch')) return;

    onCut();

    gameRef.gameManager.onScore();
  }
}
