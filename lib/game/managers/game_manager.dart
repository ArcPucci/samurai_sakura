import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/services/services.dart';

enum GameState { idle, playing, lose }

class GameManager extends Component with HasGameRef<MyGame> {
  GameManager(this._preferencesService);

  final PreferencesService _preferencesService;

  ValueNotifier<int> health = ValueNotifier(3);
  ValueNotifier<int> score = ValueNotifier(0);
  ValueNotifier<double> seconds = ValueNotifier(0);

  GameState gameState = GameState.idle;

  int _bestScore = 0;
  int _bestTime = 0;

  int get bestTime => _bestTime;

  int get bestScore => _bestScore;

  void onInit() {
    health.value = 3;
    score.value = 0;
    seconds.value = 0;
    gameState = GameState.idle;
    _bestScore = _preferencesService.getScore();
    _bestTime = _preferencesService.getTime();
  }

  void onStart() {
    gameState = GameState.playing;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameState != GameState.playing) return;
    seconds.value += dt;
  }

  void onScore(int points) => score.value += points;

  void onFail() async {
    health.value--;

    if (health.value == 0) {
      gameState = GameState.lose;

      final time = seconds.value.toInt();

      if (_bestTime < time) {
        await _preferencesService.onSetTime(time);
        _bestTime = time;
      }
      if (_bestScore < score.value) {
        await _preferencesService.onSetScore(score.value);
        _bestScore = score.value;
      }

      gameRef.onLose();
      return;
    }
  }

  void onPause() => gameState = GameState.idle;

  void onContinue() => gameState = GameState.playing;
}
