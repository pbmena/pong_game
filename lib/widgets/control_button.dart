import 'package:flutter/material.dart';
import 'package:pong_game/utils/constants.dart';

class ControlButton extends StatelessWidget {
  const ControlButton(
      {super.key, this.buttonIcon, required this.onControlPressed});

  final IconData? buttonIcon;
  final VoidCallback onControlPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onControlPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Kvalues.fixedSize,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Icon(
        buttonIcon,
        color: Colors.black,
        size: 30,
      ),
    );
  }
}
