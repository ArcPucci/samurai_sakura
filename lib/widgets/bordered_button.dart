import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/utils/utils.dart';

class BorderedButton extends StatelessWidget {
  const BorderedButton({super.key, required this.name, this.onTap, this.width});

  final String name;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 247.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2.sp, color: AppTheme.red2),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          name,
          style: AppTextStyles.semibold20.copyWith(color: AppTheme.red1),
        ),
      ),
    );
  }
}
