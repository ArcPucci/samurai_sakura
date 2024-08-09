import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:id_295/utils/app_text_styles.dart';
import 'package:id_295/widgets/custom_button.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/items/bg.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/items/samurai.png',
                    width: 266.w,
                    height: 239.h,
                  ),
                  Gap(60.h),
                  SizedBox(
                    width: 343.w,
                    height: 152.h,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            style: AppTextStyles.semibold32,
                            text: 'Welcome to Martial Virtue\n',
                          ),
                          const TextSpan(
                            text: '\n',
                          ),
                          TextSpan(
                            style: AppTextStyles.medium18,
                            text:
                                'Learn about China’s culture, the concept of Chinese Xia, play games and much more!',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(32.h),
                  CustomButton(
                    text: 'Continue',
                    onTap: () => context.go('/'),
                  ),
                  Gap(24.h),
                  SizedBox(
                    width: 375.w,
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Privacy Policy', style: AppTextStyles.semibold14),
                        Gap(36.w),
                        Text('Terms of Use', style: AppTextStyles.semibold14),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
