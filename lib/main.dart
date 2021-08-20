import 'package:flutter/material.dart';
import 'package:flame/game.dart'; // for creating Game class
import 'package:flame/gestures.dart'; // for TapDetector
import 'dart:ui'; // for Canvas and Size
// import 'package:flutter/gestures.dart';

void main() {
  BoxGame game = BoxGame(); // create instance of class
  // TapGestureRecognizer tapper = TapGestureRecognizer();
  // tapper.onTapDown = game.onTapDown;

  runApp(game.widget); // run game
}

class BoxGame extends Game with TapDetector {
  Size? screenSize;
  bool hasWon = false;

  //
  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails tapDownDetails) {
    // handle taps here
    double screenCenterX = screenSize!.width / 2;
    double screenCenterY = screenSize!.height / 2;
    if (tapDownDetails.globalPosition.dx >= screenCenterX - 75 &&
        tapDownDetails.globalPosition.dx <= screenCenterX + 75 &&
        tapDownDetails.globalPosition.dy >= screenCenterY - 75 &&
        tapDownDetails.globalPosition.dy <= screenCenterY + 75) {
      hasWon = true;
    }
  }

  /// MAIN GAME LOOP
  /// 1. UPDATE VARIABLES,
  @override
  void update(double t) {
    // TODO: implement update
  }

  /// 2. RENDER FRAME
  @override
  void render(Canvas canvas) {
    /// BACKGROUND
    Rect bgRect = Rect.fromLTWH(0, 0, screenSize!.width, screenSize!.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xffbbcc00);
    canvas.drawRect(bgRect, bgPaint);

    /// TARGET BOX
    print(screenSize); // ! target box does not change with screen size
    double screenCenterX = screenSize!.width / 2;
    double screenCenterY = screenSize!.height / 2;
    Rect boxRect =
        Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xffffffff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }
}
