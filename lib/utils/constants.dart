import 'package:flutter/material.dart';

class Kvalues {
  static TextStyle scoreStyle = TextStyle(color: Colors.grey[600], fontSize: 45);

  static BoxShadow blockShadow = BoxShadow(
                color: const Color(0xFF000000).withAlpha(60),
                blurRadius: 6.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 3.0));
  
  static const Size fixedSize = Size(100, 48);
}