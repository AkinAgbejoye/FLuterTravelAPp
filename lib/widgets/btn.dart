import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';
import 'package:notes/widgets/app_normarl.dart';

class Btn extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const Btn({Key? key, this.isResponsive = false, this.width = 120})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppNormal(text: "Book A Trip", color: Colors.white))
                : Container(),
            Image.asset("img/button-one.png")
          ],
        ),
      ),
    );
  }
}
