import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes/misc/colors.dart';
import 'package:notes/widgets/app_bold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70, left: 20),
            child: Row(children: [
              Icon(Icons.menu, size: 30, color: Colors.black54),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5)),
              )
            ]),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
              margin: EdgeInsets.only(left: 20),
              child: AppBold(text: "Discover")),
          SizedBox(
            height: 40,
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
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
                controller: _tabController,
                children: [Text("Hi"), Text("There"), Text("Bye")]),
          )
        ],
      ),
    );
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
