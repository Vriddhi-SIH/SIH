// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih_2022/screens/child/home.dart';
import 'package:sih_2022/screens/home/home_screen.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SharedPreferences _prefs;
  String password = '';
  String newvalue = '';

  retrieveStringValue() async {
    _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("password");
    setState(() {
      password = value as String;
    });

    Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  @override
  void initState() {
    retrieveStringValue();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(HomeScreen1.routeName);
          return Future.delayed(Duration(microseconds: 0));
        },
        child: Material(
          color: Colors.grey[200],
          child: Center(
              child: InkWell(
                  onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text(
                              "Enter the Password To Enter Child Mode"),
                          actionsPadding: EdgeInsets.all(20),
                          actions: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width / 2.5,
                              height: 80,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Enter the Password ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    newvalue = value;
                                  });
                                },
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  password == newvalue
                                      ? Get.offAllNamed(HomeScreen.routeName)
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text('Wrong Password')));
                                },
                                child: Text("Login")),
                          ],
                        ),
                      ),
                  child: Container(
                    // color: Colors.red[400],
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Back To Parent Mode",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    )),
                  ))),
        ));
  }
}
