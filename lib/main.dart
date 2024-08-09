import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_app.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      const ScreenUtilInit(
        designSize: Size(375, 812),
        child: MyApp(),
      )
    );
  }, (error, stack) {
    if(kDebugMode) {
      print(error);
      print(stack);
    }
  });
}