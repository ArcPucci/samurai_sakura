import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/utils/utils.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
  });

  final VoidCallback onTap;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 147.w,
        height: 145.h,
        decoration: BoxDecoration(
          color: AppTheme.red1,
          borderRadius: BorderRadius.circular(16),
          border: const Border(
            bottom: BorderSide(
              width: 8,
              color: AppTheme.red2,
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 39.w,
              height: 36.h,
            ),
            Gap(16.h),
            Text(text, style: AppTextStyles.semibold24),
          ],
        ),
      ),
    );
  }
}
