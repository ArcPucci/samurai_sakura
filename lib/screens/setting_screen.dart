import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/providers/providers.dart';
import 'package:id_295/screens/screens.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
              child: Consumer<PreferencesProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  return Column(
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
                      PremiumBox(premium: value.premium),
                      Gap(24.h),
                      const SettingWidget(text: 'Privacy Policy'),
                      Gap(12.h),
                      const SettingWidget(text: 'Terms of Use'),
                      Gap(12.h),
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
                              value: value.notification,
                              onChanged: (_) => value.onChangeNotification(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
