import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  final SharedPreferences _preferences;

  PreferencesService(this._preferences);

  static const premiumKey = "PREMIUM";
  static const notificationsKey = "NOTIFICATIONS";
  static const firstInitKey = "FIRST_INIT";
  static const scoreKey = "SCORE";
  static const timeKey = "TIME";

  Future<void> onSetPremium() async {
    await _preferences.setBool(premiumKey, true);
  }

  bool getPremium() => _preferences.getBool(premiumKey) ?? false;

  Future<void> onSetFirstInit() async {
    await _preferences.setBool(firstInitKey, false);
  }

  bool getFirstInit() => _preferences.getBool(firstInitKey) ?? true;

  Future<void> onSetNotification(bool enabled) async {
    await _preferences.setBool(notificationsKey, enabled);
  }

  bool getNotification() => _preferences.getBool(notificationsKey) ?? true;

  Future<void> onSetScore(int score) async {
    await _preferences.setInt(scoreKey, score);
  }

  int getScore() => _preferences.getInt(scoreKey) ?? 0;

  Future<void> onSetTime(int time) async {
    await _preferences.setInt(timeKey, time);
  }

  int getTime() => _preferences.getInt(timeKey) ?? 0;
}
