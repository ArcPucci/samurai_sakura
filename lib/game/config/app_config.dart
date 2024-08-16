import 'package:flame/components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/main.dart';

class AppConfig {
  static const gravity = -9.81;

  static final playerWidth = 110.w;
  static final playerHeight = 99.h;

  static final shadowWidth = 120.w;
  static final shadowHeight = 12.h;

  static final leastWidth = 40.w;
  static final leastHeight = 40.h;

  static final shapeSize = Vector2.all(40.sp);
  static final torchSize = Vector2(40.w, 65.h);

  static final startPosY = 114.h + topPadding - shapeSize.y / 2;
}
