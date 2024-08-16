import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:id_295/utils/utils.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({super.key, required this.icon, this.onClose});

  final String icon;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClose ?? context.pop,
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: AppTheme.red1,
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(
              width: 3,
              color: AppTheme.red2,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Image.asset(
          icon,
          width: 16.w,
          height: 16.h,
        ),
      ),
    );
  }
}
