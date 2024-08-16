import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/providers/providers.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
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
                          ArrowWidget(
                            icon: 'assets/items/x.png',
                            onClose: Navigator.of(context).pop,
                          ),
                          Text('Premium', style: AppTextStyles.semibold16),
                          Gap(42.w),
                        ],
                      ),
                    ),
                    Gap(86.h),
                    Image.asset(
                      'assets/items/crown.png',
                      width: 224.w,
                      height: 196.h,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 343.w,
                      height: 114.h,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              style: AppTextStyles.semibold32,
                              text: 'Premium Plan\n',
                            ),
                            const TextSpan(
                              text: '\n',
                            ),
                            TextSpan(
                              style: AppTextStyles.medium18,
                              text:
                                  'Enjoy exploring, playing, reading, and learning without any adds only for \n\$0,49 per month!',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(32.h),
                    CustomButton(
                      onTap: () => onBuyPremium(context),
                      text: 'Buy Premium for \$0,49',
                    ),
                    Gap(24.h),
                    GestureDetector(
                      onTap: () => onBuyPremium(context),
                      child: Container(
                        height: 56.h,
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Text('Restore', style: AppTextStyles.semibold14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onBuyPremium(BuildContext context) {
    final value = Provider.of<PreferencesProvider>(context, listen: false);
    value.onBuyPremium();
    Navigator.of(context).pop();
  }
}
