import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/app_cubit_state.dart';
import 'package:notes/cubits/app_cubits.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';
import 'package:notes/widgets/app_normarl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Row(children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20),
                child: AppBold(text: "Discover")),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabBarIndicator(
                        color: AppColors.mainColor, radius: 4),
                    tabs: [
                      Tab(text: "Places"),
                      Tab(
                        text: "Inspirations",
                      ),
                      Tab(
                        text: "Emotions",
                      )
                    ]),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                  itemCount: info.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AppCubits>(context)
                            .detailsPage(info[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://mark.bslmeiyu.com/uploads/" +
                                      info[index].img),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                ),
                Text("There"),
                Text("Bye")
              ]),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBold(
                    text: "Explore",
                    size: 22,
                  ),
                  AppNormal(
                    text: "See All",
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                height: 100,
                width: double.maxFinite,
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 50),
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "img/" + images.keys.elementAt(index)),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 50),
                              child: AppBold(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }))
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}

class CircleTabBarIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabBarIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
