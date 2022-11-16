import 'package:flutter/material.dart';
import 'package:pong_game/utils/constants.dart';

class CustomBlock extends StatelessWidget {
  const CustomBlock({
    Key? key,
    required this.blockCrossAxis,
    required this.blockMainAxis,
    required this.blockWidth,
    required this.isRival,
  }) : super(key: key);

  final double blockCrossAxis;
  final double blockMainAxis;
  final double blockWidth;
  final bool isRival;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(
          (2 * blockCrossAxis + blockWidth) / (2 - blockWidth), blockMainAxis),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 15,
          width: MediaQuery.of(context).size.width * blockWidth / 2.5,
          decoration: BoxDecoration(
            color: isRival ? Colors.cyanAccent : Colors.pinkAccent,
            boxShadow: [Kvalues.blockShadow],
          ),
        ),
      ),
    );
  }
}
