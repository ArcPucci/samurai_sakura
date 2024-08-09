import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holding_gesture/holding_gesture.dart';
import 'package:id_295/utils/utils.dart';

class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    this.left = true,
    required this.onTap,
    required this.onCancel,
    required this.onHold,
  });

  final void Function() onCancel;
  final void Function() onHold;
  final void Function() onTap;
  final bool left;

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      onHold: onHold,
      onTap: onTap,
      onCancel: onCancel,
      child: Container(
        width: 147.w,
        height: 72.h,
        decoration: BoxDecoration(
          color: AppTheme.red1,
          borderRadius: BorderRadius.circular(24),
          border: Border(
            bottom: BorderSide(width: 4.sp, color: AppTheme.red2),
          ),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          left ? 'assets/items/go_left.png' : "assets/items/go_right.png",
          width: 40.w,
          height: 40.h,
        ),
      ),
    );
  }
}
