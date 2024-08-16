import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';

late double topPadding;

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();
    final preferencesService = PreferencesService(preferences);

    runApp(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MyApp(preferencesService: preferencesService),
      ),
    );
  }, (error, stack) {
    if (kDebugMode) {
      print(error);
      print(stack);
    }
  });
}
