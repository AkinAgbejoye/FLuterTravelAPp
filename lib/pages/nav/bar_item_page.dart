import 'package:flutter/material.dart';

class BarItem extends StatelessWidget {
  const BarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text("Bar Item"),
      ),
    );
  }
}
