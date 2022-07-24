// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes/pages/nav/bar_item_page.dart';
import 'package:notes/pages/nav/home_page.dart';
import 'package:notes/pages/nav/my_page.dart';
import 'package:notes/pages/nav/serch_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List pages = [HomePage(), BarItem(), SearchPage(), MyPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.search_sharp)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
          ]),
    );
  }
}
