// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  // late double physics = 0;
  // double chemistry = 0;
  // double maths = 0;
  // double history = 0;
  // double english = 0;

  // late String physics1 = '';
  // late String chemistry1 = '';
  // late String maths1 = '';
  // String history1 = '';

  // String english1 = '';

  @override
  void initState() {
    Future.delayed(Duration(seconds: 10));
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
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.top,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          )),
    );
  }

  // @override
  // void initState() {
  //   Future.delayed(Duration(milliseconds: 2));

  //   setState(() {});
  //   loading = false;
  //   setState(() {});

  //   super.initState();
  // }

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
          extendBodyBehindAppBar: true,
          body: Container(
            color: Color.fromRGBO(255, 100, 100, 1),
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
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              foregroundImage: _auth.getUser() == null
                                  ? null
                                  : NetworkImage(_auth.getUser()!.photoURL!),
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              _auth.getUser() == null
                                  ? "Hello Mate"
                                  : _auth.getUser()!.displayName ?? '',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Center(
                                child: Text(
                                  'My recent tests ',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    _auth.getUser() == null
                                        ? Get.find<AuthController>()
                                            .navigateToLogin()
                                        : Get.find<AuthController>().signOut();
                                  },
                                  child: Text(
                                      _auth.getUser() == null
                                          ? "Sign In"
                                          : "Sign Out",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
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
                              color: Color.fromARGB(255, 253, 233, 240),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Your Stats",
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
