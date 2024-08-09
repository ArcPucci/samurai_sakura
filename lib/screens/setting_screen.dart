import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/screens/screens.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _lights = false;

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
                children: [
                  Gap(8.h),
                  SizedBox(
                    width: 327.w,
                    height: 42.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ArrowWidget(icon: 'assets/items/left.png'),
                        Text('Settings', style: AppTextStyles.semibold16),
                        Gap(42.w),
                      ],
                    ),
                  ),
                  Gap(32.h),
                  Container(
                    width: 311.w,
                    height: 202.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        width: 1,
                        color: AppTheme.red2,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.w,
                      vertical: 32.h,
                    ),
                    child: Column(
                      children: [
                        Text('Premium Plan',
                            style: AppTextStyles.semibold24Red),
                        Gap(16.h),
                        GestureDetector(
                          onTap: () => onTapPremium(context),
                          child: Text(
                            'Adds Free',
                            style: AppTextStyles.medium16,
                          ),
                        ),
                        Gap(24.h),
                        Container(
                          width: 247.w,
                          height: 50.h,
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
                          child: Text(
                            'See more',
                            style: AppTextStyles.semibold20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(24.h),
                  const SettingWidget(text: 'Privacy Policy'),
                  Gap(12.h),
                  const SettingWidget(text: 'Terms of Use'),
                  Gap(12.h),
                  //const SettingWidget(text: 'Notifications'),
                  Container(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 17.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Notifications',
                          style: AppTextStyles.semibold20and26,
                        ),
                        CupertinoSwitch(
                          value: _lights,
                          onChanged: (bool value) {
                            setState(() {
                              _lights = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapPremium(BuildContext context) {
    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
