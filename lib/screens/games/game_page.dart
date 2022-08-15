import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/screens/child/home.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(HomeScreen1.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
        child: Center(
          child: Text("hello World"),
        ),
      ),
    );
  }
}
