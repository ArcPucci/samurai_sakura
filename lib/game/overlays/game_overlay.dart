import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class GameOverlay extends StatelessWidget {
  const GameOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final player = (game as MyGame).player;
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        child: SizedBox(
          width: 375.w,
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
                    Text('Game', style: AppTextStyles.semibold16),
                    Gap(42.w),
                  ],
                ),
              ),
              Gap(16.h),
              SizedBox(
                width: 311.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomBox(
                      children: [
                        Image.asset(
                          'assets/items/flower.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(8.w),
                        Text(
                          "75",
                          style: AppTextStyles.semibold16.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    CustomBox(
                      children: [
                        Image.asset(
                          'assets/items/filled_hp.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(4.w),
                        Image.asset(
                          'assets/items/filled_hp.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(4.w),
                        Image.asset(
                          'assets/items/empty_hp.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                      ],
                    ),
                    CustomBox(
                      children: [
                        Image.asset(
                          'assets/items/time.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(8.w),
                        Text(
                          "01:35",
                          style: AppTextStyles.semibold16.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GameButton(
                    onTap: () => player.onTap(PlayerDirection.left),
                    onCancel: player.onCancel,
                    onHold: player.onGoLeft,
                  ),
                  Gap(16.w),
                  GameButton(
                    left: false,
                    onTap: () => player.onTap(PlayerDirection.right),
                    onCancel: player.onCancel,
                    onHold: player.onGoRight,
                  ),
                ],
              ),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
