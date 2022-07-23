import 'package:flutter/material.dart';

class AppNormal extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const AppNormal(
      {Key? key,
      this.size = 16,
      required this.text,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}