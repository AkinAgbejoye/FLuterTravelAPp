import 'package:flutter/material.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';
import 'package:notes/widgets/app_normarl.dart';
import 'package:notes/widgets/btn.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List images = ["a.png", "b.png", "c.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      // ignore: prefer_interpolation_to_compose_strings
                      image: AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppBold(text: "Trips"),
                        AppNormal(text: "Mountain", size: 30),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppNormal(
                            text:
                                "Mountain hike gives you an incredible sense of freedom and endurance test",
                            color: AppColors.textColor2,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Btn()
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
