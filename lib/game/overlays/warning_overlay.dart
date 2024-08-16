import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:id_295/game/game.dart';
import 'package:id_295/utils/utils.dart';
import 'package:id_295/widgets/widgets.dart';

class WarningOverlay extends StatelessWidget {
  const WarningOverlay(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    final myGame = game as MyGame;
    return Material(
      color: Colors.black.withOpacity(0.4),
      child: Center(
        child: Container(
          width: 311.w,
          height: 169.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Are you sure that you want to\nleave? ",
                      style: AppTextStyles.medium16.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Your progress will be\nlost!",
                      style: AppTextStyles.medium16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 247.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BorderedButton(
                      name: 'Leave',
                      width: 115.w,
                      onTap: context.pop,
                    ),
                    BorderedButton(
                      name: 'Stay',
                      width: 115.w,
                      onTap: myGame.onContinue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
