import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_cubit_state.dart';
import 'package:notes/cubits/app_cubits.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';
import 'package:notes/widgets/app_button.dart';
import 'package:notes/widgets/app_normarl.dart';
import 'package:notes/widgets/btn.dart';

class DetailedPage extends StatefulWidget {
  const DetailedPage({Key? key}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailedState details = state as DetailedState;
      return Scaffold(
        body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    details.place.img),
                            fit: BoxFit.cover),
                      ),
                    )),
                Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<AppCubits>(context).goHome();
                            },
                            icon: Icon(Icons.menu, color: Colors.white))
                      ],
                    )),
                Positioned(
                    top: 300,
                    child: Container(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          top: 30,
                        ),
                        height: 500,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppBold(
                                  text: details.place.name,
                                  color: Colors.black.withOpacity(0.8),
                                  size: 20,
                                ),
                                AppBold(
                                  text: "\$" + details.place.price.toString(),
                                  color: AppColors.mainColor,
                                  size: 20,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                AppNormal(
                                  text: details.place.location,
                                  color: AppColors.textColor1,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Wrap(
                                    children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < details.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                })),
                                SizedBox(
                                  width: 10,
                                ),
                                AppBold(
                                  text: "(4.0)",
                                  color: AppColors.textColor2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            AppBold(
                              text: "People",
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppNormal(
                              text: "Number of people in your group",
                              color: AppColors.mainTextColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    child: AppButton(
                                      color: selectedIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      size: 50,
                                      borderColor: selectedIndex == index
                                          ? Colors.black
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AppBold(
                              text: "Description",
                              color: Colors.black.withOpacity(0.8),
                              size: 20,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AppNormal(
                                text: details.place.description,
                                color: AppColors.textColor2)
                          ],
                        ))),
                Positioned(
                    bottom: 10,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButton(
                          color: AppColors.textColor1,
                          backgroundColor: Colors.white,
                          size: 60,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Btn(
                          isResponsive: true,
                        )
                      ],
                    ))
              ],
            )),
      );
    });
  }
}
