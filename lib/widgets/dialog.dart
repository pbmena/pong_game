import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.rivalLost,
    required this.reset,
  });

  final bool rivalLost;
  final Function() reset;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.greenAccent,
      title: Center(
        child: Text(
          rivalLost ? "You won!" : "Your rival won!",
          style: const TextStyle(color: Colors.black),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 25),
      actions: [
        ElevatedButton(
          onPressed: reset,
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(120, 45),
            backgroundColor: rivalLost ? Colors.pink[200] : Colors.cyan[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: const Text(
            'Play again',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
