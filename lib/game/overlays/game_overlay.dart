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
    final myGame = game as MyGame;
    final player = myGame.player;
    return SafeArea(
      child: SizedBox(
        width: 375.w,
        child: Column(
          children: [
            Gap(8.h),
            Material(
              color: Colors.transparent,
              child: SizedBox(
                width: 327.w,
                height: 42.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ArrowWidget(
                      icon: 'assets/items/left.png',
                      onClose: myGame.onPause,
                    ),
                    Text('Game', style: AppTextStyles.semibold16),
                    Gap(42.w),
                  ],
                ),
              ),
            ),
            Gap(16.h),
            Material(
              color: Colors.transparent,
              child: SizedBox(
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
                        ValueListenableBuilder(
                          valueListenable: myGame.gameManager.score,
                          builder: (context, value, child) {
                            return Text(
                              "$value",
                              style: AppTextStyles.semibold16.copyWith(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: myGame.gameManager.health,
                      builder: (context, value, child) {
                        return CustomBox(
                          children: List.generate(
                            3,
                            (index) {
                              final last = index != 2;

                              if (value <= index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    right: last ? 0 : 4.w,
                                  ),
                                  child: Image.asset(
                                    'assets/items/empty_hp.png',
                                    width: 24.w,
                                    height: 24.h,
                                  ),
                                );
                              }

                              return Padding(
                                padding: EdgeInsets.only(
                                  right: last ? 0 : 4.w,
                                ),
                                child: Image.asset(
                                  'assets/items/filled_hp.png',
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    CustomBox(
                      children: [
                        Image.asset(
                          'assets/items/time.png',
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(8.w),
                        ValueListenableBuilder(
                          valueListenable: myGame.gameManager.seconds,
                          builder: (context, value, child) {
                            final temp = value.toInt();
                            final seconds = temp % 60;
                            final minutes = temp ~/ 60;
                            final min = minutes.toString().padLeft(2, '0');
                            final sec = seconds.toString().padLeft(2, '0');
                            return Text(
                              "$min:$sec",
                              style: AppTextStyles.semibold16.copyWith(
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
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
    );
  }
}
