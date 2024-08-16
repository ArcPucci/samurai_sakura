import 'package:flutter/material.dart';
import 'package:id_295/services/services.dart';

class PreferencesProvider extends ChangeNotifier {
  final PreferencesService _preferencesService;

  PreferencesProvider({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService;

  bool _premium = false;

  bool get premium => _premium;

  bool _notification = false;

  bool get notification => _notification;

  void onInit() {
    _premium = _preferencesService.getPremium();
    _notification = _preferencesService.getNotification();
  }

  void onChangeNotification() async {
    _notification = !_notification;
    await _preferencesService.onSetNotification(_notification);
    notifyListeners();
  }

  void onBuyPremium() async {
    _premium = true;
    await _preferencesService.onSetPremium();
    notifyListeners();
  }
}
