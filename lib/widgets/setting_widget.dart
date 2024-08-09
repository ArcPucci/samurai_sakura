import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/utils/app_text_styles.dart';
import 'package:id_295/utils/app_theme.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: AppTheme.red2,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
      child: Text(text, style: AppTextStyles.semibold20and26),
    );
  }
}
