import 'package:flutter/material.dart';
import 'package:pong_game/utils/constants.dart';

class ScoreCheck extends StatelessWidget {
  const ScoreCheck(
      {super.key,
      required this.hasPlayed,
      required this.rivalScoreCheck,
      required this.playerScoreCheck});

  final bool hasPlayed;
  final int rivalScoreCheck;
  final int playerScoreCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: const Alignment(-0.3, 0),
            child: Text(
              '$rivalScoreCheck',
              style: Kvalues.scoreStyle,
            ),
          ),
        ),
        Expanded(
          child: VerticalDivider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Container(
            alignment: const Alignment(0.3, 0),
            child: Text(
              '$playerScoreCheck',
              style: Kvalues.scoreStyle,
            ),
          ),
        ),
      ],
    );
  }
}
