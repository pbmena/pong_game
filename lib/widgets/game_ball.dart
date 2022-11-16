import 'package:flutter/material.dart';

class GameBall extends StatelessWidget {
  const GameBall({Key? key, this.ballCrossAxis, this.ballMainAxis})
      : super(key: key);

  final double? ballCrossAxis;
  final double? ballMainAxis;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(ballCrossAxis!, ballMainAxis!),
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
        ),
        width: 15.0,
        height: 15.0,
      ),
    );
  }
}
