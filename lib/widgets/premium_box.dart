import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/screens/screens.dart';
import 'package:id_295/utils/utils.dart';

class PremiumBox extends StatelessWidget {
  const PremiumBox({super.key, this.premium = false});

  final bool premium;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('Premium Plan', style: AppTextStyles.semibold24Red),
          Gap(16.h),
          Text(
            'Adds Free',
            style: AppTextStyles.medium16,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => onTapPremium(context),
            child: Container(
              width: 247.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: premium ? AppTheme.grey2 : AppTheme.red1,
                borderRadius: BorderRadius.circular(16),
                border: Border(
                  bottom: BorderSide(
                    width: 4.sp,
                    color: premium ? AppTheme.grey1 : AppTheme.red2,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                premium ? 'Premium is active' : 'See more',
                style: AppTextStyles.semibold20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapPremium(BuildContext context) {
    if (premium) return;

    final route = MaterialPageRoute(
      builder: (context) => const PremiumScreen(),
    );

    Navigator.of(context, rootNavigator: true).push(route);
  }
}
