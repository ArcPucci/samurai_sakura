import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class Instructions2Overlay extends StatelessWidget {
  const Instructions2Overlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final myGame = game as MyGame;
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Container(
          width: 311.w,
          height: 359.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/torch.png',
                width: 30.w,
                height: 49.h,
              ),
              Image.asset(
                'assets/images/samurai.png',
                width: 81.w,
                height: 74.h,
              ),
              Text(
                "Break lanterns by moving the\nwarrior with right/left arrows\nand tapping the screen at\nthe right moment.",
                textAlign: TextAlign.center,
                style: AppTextStyles.medium16.copyWith(
                  color: Colors.black,
                ),
              ),
              BorderedButton(name: "Close", onTap: myGame.onStart),
            ],
          ),
        ),
      ),
    );
  }
}
