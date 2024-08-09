import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/box_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.white1,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/items/bg.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Gap(20.h),
                  Text('Main', style: AppTextStyles.semibold16),
                  Gap(43.h),
                  GestureDetector(
                    onTap: () => context.go('/game'),
                    child: Container(
                      width: 311.w,
                      height: 240.h,
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
                            'assets/items/samurai.png',
                            width: 111.w,
                            height: 99.h,
                          ),
                          Gap(16.h),
                          Text('Game', style: AppTextStyles.semibold24),
                        ],
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BoxWidget(
                        onTap: () => context.go('/xia'),
                        icon: 'assets/items/xia.png',
                        text: 'Xia',
                      ),
                      Gap(16.w),
                      BoxWidget(
                        onTap: () => context.go('/setting'),
                        icon: 'assets/items/setting.png',
                        text: 'Settings',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
