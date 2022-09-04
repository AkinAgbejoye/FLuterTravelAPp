import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final borderColor;
  final String? text;
  final IconData? icon;
  final bool? isIcon;
  const AppButton(
      {Key? key,
      this.icon,
      this.text = "1",
      this.isIcon = false,
      required this.color,
      required this.backgroundColor,
      required this.size,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(
              child: AppBold(
              text: text!,
              color: color,
            ))
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
