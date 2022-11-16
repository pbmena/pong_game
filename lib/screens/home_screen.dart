import 'dart:async';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../utils/enum.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double player = -0.15;
  double rival = 0;
  int playerScoreCheck = 0;
  int rivalScoreCheck = 0;

  double blockWidth = 0.35;
  bool hasPlayed = false;

  double ballX = 0;
  double ballY = 0;
  var ballYMove = Movement.down;
  var ballXMove = Movement.left;

  void start() {
    hasPlayed = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      updateMovement();
      //ball movement
      setState(() {
        if (ballYMove == Movement.down) {
          ballY += 0.008;
        } else if (ballYMove == Movement.up) {
          ballY -= 0.008;
        }

        if (ballXMove == Movement.left) {
          ballX -= 0.012;
        } else if (ballXMove == Movement.right) {
          ballX += 0.012;
        }
      });

      //rival movement
      setState(() => rival = ballX);

      if (isPlayerLost()) {
        if (rivalScoreCheck >= 9) {
          rivalScoreCheck = 0;
        }
        rivalScoreCheck++;
        timer.cancel();
        _showDialog(false);
      }

      if (isRivalLost()) {
        if (playerScoreCheck >= 9) {
          playerScoreCheck = 0;
        }
        playerScoreCheck++;
        timer.cancel();
        _showDialog(true);
      }
    });
  }

  void updateMovement() {
    setState(() {
      if (ballY >= 0.85 && player + blockWidth >= ballX && player <= ballX) {
        ballYMove = Movement.up;
      } else if (ballY <= -0.9 &&
          rival + blockWidth >= ballX &&
          rival <= ballX) {
        ballYMove = Movement.down;
      }

      if (ballX >= 1) {
        ballXMove = Movement.left;
      } else if (ballX <= -1) {
        ballXMove = Movement.right;
      }
    });
  }

  bool isPlayerLost() {
    if (ballY >= 1) return true;
    return false;
  }

  bool isRivalLost() {
    if (ballY <= -1) return true;
    return false;
  }

  void _showDialog(bool rivalLost) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return CustomDialog(
          rivalLost: rivalLost,
          reset: reset,
        );
      }),
    );
  }

  void reset() {
    Navigator.pop(context);

    setState(() {
      hasPlayed = false;
      ballX = 0;
      ballY = 0;
      player = -0.15;
      rival = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: GestureDetector(
                onTap: start,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purpleAccent),
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.purpleAccent,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        InitMessage(hasPlayed: hasPlayed),
                        Container(
                          margin: const EdgeInsets.only(right: 50),
                          child: CustomBlock(
                            blockCrossAxis: rival,
                            blockMainAxis: -0.9,
                            blockWidth: blockWidth,
                            isRival: true,
                          ),
                        ),
                        GameBall(ballCrossAxis: ballX, ballMainAxis: ballY),
                        Container(
                          margin: const EdgeInsets.only(right: 8.5),
                          child: CustomBlock(
                            blockCrossAxis: player,
                            blockMainAxis: 0.9,
                            blockWidth: blockWidth,
                            isRival: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ControlButton(
                        buttonIcon: Icons.arrow_left_sharp,
                        onControlPressed: () {
                          setState(() {
                            if (!(player - 0.1 <= -1)) player -= 0.2;
                          });
                        },
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      flex: 2,
                      child: ScoreCheck(
                        hasPlayed: hasPlayed,
                        rivalScoreCheck: rivalScoreCheck,
                        playerScoreCheck: playerScoreCheck,
                      ),
                    ),
                    const Spacer(flex: 1),
                    Expanded(
                      child: ControlButton(
                        buttonIcon: Icons.arrow_right_sharp,
                        onControlPressed: () {
                          setState(() {
                            if (!(player + blockWidth >= 1)) player += 0.2;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
