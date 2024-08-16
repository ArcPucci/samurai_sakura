import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/services/services.dart';

class MyGame extends FlameGame with TapCallbacks {
  final PreferencesService preferencesService;

  final list = ["torch.png", "flower1.png", "flower2.png"];

  final double topPadding;

  late Player player;
  late PlayerShadow playerShadow;
  late ObjectManager objectManager;
  late GameManager gameManager;

  MyGame({
    super.children,
    super.world,
    super.camera,
    required this.topPadding,
    required this.preferencesService,
  });

  @override
  FutureOr<void> onLoad() async {
    for (final item in list) {
      await images.load(item);
    }

    playerShadow = PlayerShadow();
    objectManager = ObjectManager();
    gameManager = GameManager(preferencesService);

    player = Player(position: Vector2(size.x / 2, size.y / 1.48));

    add(player);
    add(playerShadow);
    add(gameManager);

    overlays.add('game_overlay');
    overlays.add('instructions1');
    await super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    super.onTapUp(event);
    objectManager.onCut();
  }

  void onNext() {
    overlays.remove('instructions1');
    overlays.add('instructions2');
  }

  void onStart() {
    gameManager.onInit();

    overlays.remove('instructions2');

    if (children.contains(objectManager)) objectManager.removeFromParent();

    add(objectManager);
    overlays.add('game_overlay');

    gameManager.onStart();
  }

  void onLose() => overlays.add('results');

  void onPause() {
    gameManager.onPause();
    overlays.add('warning');
  }

  void onContinue() {
    overlays.remove('warning');
    gameManager.onContinue();
  }

  void onRestart() {
    gameManager.onInit();

    overlays.remove('results');
    if (children.contains(objectManager)) objectManager.removeFromParent();

    add(objectManager);
    gameManager.onStart();
  }
}
