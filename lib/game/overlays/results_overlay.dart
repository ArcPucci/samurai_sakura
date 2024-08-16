import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class ResultsOverlay extends StatelessWidget {
  const ResultsOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final myGame = game as MyGame;
    final gameManager = myGame.gameManager;
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Container(
          width: 311.w,
          height: 294.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildResult(
                "Your Result:",
                gameManager.score.value,
                gameManager.seconds.value,
                false,
              ),
              _buildResult(
                "Best Result",
                gameManager.bestScore,
                gameManager.bestTime.toDouble(),
                true,
              ),
              BorderedButton(
                name: "Start Again",
                onTap: myGame.onRestart,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResult(String title, int score, double time, bool best) {
    final temp = time.toInt();
    final min = temp ~/ 60;
    final sec = temp % 60;

    final minutes = min.toString().padLeft(2, '0');
    final seconds = sec.toString().padLeft(2, '0');

    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.medium16.copyWith(color: Colors.black),
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomBox(
              width: 115.w,
              color: best ? AppTheme.red2 : null,
              children: [
                Image.asset(
                  'assets/items/flower.png',
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(8.w),
                Text(
                  "$score",
                  style: AppTextStyles.semibold16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CustomBox(
              color: best ? AppTheme.red2 : null,
              width: 115.w,
              children: [
                Image.asset(
                  'assets/items/time.png',
                  width: 24.w,
                  height: 24.h,
                ),
                Gap(8.w),
                Text(
                  "$minutes:$seconds",
                  style: AppTextStyles.semibold16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
