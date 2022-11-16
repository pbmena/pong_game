import 'package:flutter/material.dart';

class InitMessage extends StatelessWidget {
  const InitMessage({Key? key, required this.hasPlayed}) : super(key: key);

  final bool hasPlayed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, -0.2),
      child: Text(
        hasPlayed ? '' : 'Press to start',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
