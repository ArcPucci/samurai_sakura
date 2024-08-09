import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/utils/app_text_styles.dart';
import 'package:id_295/utils/app_theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});

  final VoidCallback? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 311.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: AppTheme.red1,
          borderRadius: BorderRadius.circular(16),
          border: const Border(
            bottom: BorderSide(
              width: 4,
              color: AppTheme.red2,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(text, style: AppTextStyles.semibold20),
      ),
    );
  }
}
