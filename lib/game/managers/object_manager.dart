import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/game/game.dart';

class ObjectManager extends Component with HasGameRef<MyGame> {
  @override
  void update(double dt) {
    super.update(dt);

    if (gameRef.gameManager.gameState != GameState.playing) return;

    final temp = children.whereType<FallingItem>().toList();

    final item = _getItem();
    final randX =
        Random().nextDouble() * (gameRef.size.x - AppConfig.shapeSize.x);

    Vector2 size = AppConfig.shapeSize;

    if (item == 'torch.png') size = AppConfig.torchSize;

    if (temp.isNotEmpty) {
      final pos = temp.last.position;

      final rand = Random().nextDouble() * 50.h + 50.h;

      if (pos.y - gameRef.size.y < rand) return;

      add(FallingItem(
        path: item,
        size: size,
        divided: false,
        image: game.images.fromCache(item),
        initPos: Vector2(randX, AppConfig.startPosY),
      ));
    } else {
      add(FallingItem(
        path: item,
        size: size,
        divided: false,
        image: game.images.fromCache(item),
        initPos: Vector2(randX, AppConfig.startPosY),
      ));
    }
  }

  String _getItem() {
    final rand = Random().nextInt(100);
    if (rand > 65) return "torch.png";

    final rand2 = Random().nextBool();
    if (rand2) return "flower1.png";

    return "flower2.png";
  }

  void onCut() {
    for (final item in children) {
      if (item is! FallingItem) continue;
      if (item.divided) continue;

      final pos = item.position;
      final playerSize = gameRef.player.size;
      final playerPos = gameRef.player.position - Vector2(playerSize.x / 2, 0);

      if (playerPos.x - item.width > pos.x) continue;
      if (playerPos.x + playerSize.x < pos.x) continue;
      if (playerPos.y - item.height > pos.y) continue;

      if (playerPos.y + playerSize.y < pos.y) continue;

      item.onCut();
      gameRef.gameManager.onScore(10);
    }
  }
}
