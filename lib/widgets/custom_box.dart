import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/utils/utils.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    super.key,
    required this.children,
    this.width,
    this.color,
  });

  final double? width;
  final Color? color;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 96.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: color ?? AppTheme.red1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
