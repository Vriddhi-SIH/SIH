// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih_2022/configs/configs.dart';
import 'package:sih_2022/controllers/article/piechart_controller.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/screens.dart';
import 'package:sih_2022/widgets/widgets.dart';
import 'package:pie_chart/pie_chart.dart';

//

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool loading = true;
  final contro = Get.put(PieChartController());
  late SharedPreferences _prefs;
  String childName = '';
  String avatar = '';
  retrieveStringValue2() async {
    _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("avatar");
    setState(() {
      if (value == null) {
      } else {
        avatar = value as String;
      }
    });

    Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  retrieveStringValue() async {
    _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("childname");
    setState(() {
      if (value == null) {
        childName = '';
      } else {
        childName = value;
      }
    });
    setState(() {});
    await Future.delayed(Duration(seconds: 1));
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 10));
    retrieveStringValue();
    retrieveStringValue2();
    setState(() {
      contro.getAllData();
    });
    super.initState();
  }

  List<Color> colorList = [
    Color.fromRGBO(82, 98, 255, 1),
    Color.fromRGBO(46, 198, 255, 1),
    Color.fromRGBO(123, 201, 82, 1),
    Color.fromRGBO(255, 171, 67, 1),
    Color.fromRGBO(252, 91, 57, 1),
    Color.fromRGBO(139, 135, 130, 1),
    Color.fromARGB(199, 127, 89, 229),
  ];
  Widget pieChartExampleOne() {
    return PieChart(
      key: ValueKey(0),
      dataMap: contro.catMap,
      initialAngleInDegree: 5,
      animationDuration: Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: 200,
      ringStrokeWidth: 35,
      colorList: colorList,
      chartLegendSpacing: 32,
      chartValuesOptions: ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValuesInPercentage: true,
          showChartValueBackground: true,
          showChartValues: true,
          chartValueStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      centerText: 'Test Results',
      legendOptions: LegendOptions(
          showLegendsInRow: true,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendPosition: LegendPosition.top,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = Get.find<AuthController>();
    final controllerw = Get.put(ProfileController());
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
        child: Scaffold(
          body: Container(
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Padding(
                    padding:
                        UIParameters.screenPadding.copyWith(top: 0, bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  foregroundImage: _auth.getUser() == null
                                      ? null
                                      : avatar == ''
                                          ? NetworkImage(
                                              _auth.getUser()!.photoURL!)
                                          : NetworkImage(avatar),
                                  backgroundColor: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  _auth.getUser() == null
                                      ? "Hello Mate"
                                      : childName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: Future.delayed(Duration(seconds: 7)),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        contro.getAllData();
                        return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Colors.pink[50],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Your Child Stats",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Divider(
                                //   thickness: 2,
                                // ),
                                pieChartExampleOne(),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ));
                      } else
                        return Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            CircularProgressIndicator(),
                          ],
                        )); // Return empty container to avoid build errors
                    }),
                Expanded(
                  child: Obx(
                    () => ContentArea(
                      decor: BoxDecoration(color: Colors.pink[50]),
                      addPadding: false,
                      child: ListView.separated(
                        padding: UIParameters.screenPadding,
                        itemCount: controllerw.allRecentTest.length,
                        physics: ScrollPhysics(),
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return RecentQuizCard(
                              recentTest: controllerw.allRecentTest[index]);
                        },
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),

                // SizedBox(
                //   height: 20,
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
