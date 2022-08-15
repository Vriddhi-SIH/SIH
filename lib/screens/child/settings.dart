import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/screens/child/home.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen1.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
        child: Center(child: Text("hello World 2 ")),
      ),
    );
  }
}
