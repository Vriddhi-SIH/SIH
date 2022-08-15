// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sih_2022/configs/configs.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/child/settings.dart';
import 'package:sih_2022/screens/games/game_page.dart';

import 'package:sih_2022/screens/home/home_screen.dart';
import 'package:sih_2022/screens/home/story_screen.dart';

import 'package:sih_2022/widgets/widgets.dart';

class HomeScreen1 extends StatefulWidget {
  HomeScreen1({Key? key}) : super(key: key);
  static const String routeName = '/home2';
  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int currentindex = 0;
  late SharedPreferences _prefs;
  late Widget currentWidget = homepage2();
  retrieveStringValue() async {
    _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("childname");
    setState(() {
      childName = value as String;
    });
    print(childName);
    currentWidget = homepage2();
    await Future.delayed(Duration(seconds: 1));
  }

  String childName = '';
  void loadScreen() {
    switch (currentindex) {
      case 0:
        currentWidget = homepage2();
        break;
      case 1:
        currentWidget = TestScreen();

        break;

      case 2:
        currentWidget = GamePage();
        break;
      case 3:
        currentWidget = SettingsPage();
        // setState(() {
        //   final cont = Get.put(PieChartController());
        //   cont.getAllData();
        // });

        // Get.lazyPut(() => ProfileController());
        // currentWidget = ProfileScreen();
        break;
    }
  }

  Widget homepage2() {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/background.png'))),
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              "Hello Little",
                              // "Hello Little 👋 ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Builder(
                        builder: (_) {
                          final AuthController _auth = Get.find();
                          final user = _auth.getUser();
                          String _label = '';
                          if (user != null) {
                            _label = childName;
                          }
                          return Align(
                            alignment: Alignment.topLeft,
                            child: Text(_label,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                          );
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      elevation: 5.00,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color.fromRGBO(237, 111, 9, 1),
                      child: InkWell(
                        onTap: () => {},
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentindex = 2;
                            });
                            loadScreen();
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 170,
                            width: 400,
                            child: Container(
                              width: 400 / 2.5,
                              margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Let's Play ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Image(
                                          image: AssetImage(
                                              'assets/images/playb.png'))
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/skater.png')),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      elevation: 5.00,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color.fromRGBO(181, 104, 50, 1),
                      child: InkWell(
                        onTap: () => {
                          setState(() {
                            currentindex = 1;
                            loadScreen();
                          })
                        },
                        child: SizedBox(
                          height: 170,
                          width: 400,
                          child: Container(
                            // margin: EdgeInsets.fromLTRB(19, 5, 0, 5),
                            child: Row(
                              children: [
                                Image(
                                    image:
                                        AssetImage('assets/images/pencil.png')),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Let's Test",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Image(
                                        image: AssetImage(
                                            'assets/images/pencilb.png'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      elevation: 5.00,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color.fromRGBO(249, 184, 128, 1),
                      child: InkWell(
                        onTap: () => {},
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              currentindex = 2;
                            });
                            loadScreen();
                            setState(() {});
                          },
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: Container(
                              width: 400 / 2.5,
                              margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Let's Play ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Image(
                                        image: AssetImage(
                                            'assets/images/baby_girl.png')),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      elevation: 5.00,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.lime[100],
                      child: InkWell(
                        onTap: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StoryPage()))
                        },
                        child: SizedBox(
                          height: 180,
                          width: 400,
                          child: Container(
                            constraints: BoxConstraints(maxWidth: 400 / 3),
                            margin: EdgeInsets.fromLTRB(19, 0, 8, 5),
                            child: Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 135.5),
                                  width:
                                      MediaQuery.of(context).size.width / 3.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Hero(
                                        tag: 'hero',
                                        child: Text(
                                          "Story Of Baby Dinosaur",
                                          style: TextStyle(
                                              color: Colors.green[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25,
                                              fontFamily: 'Nunito'),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.timer_outlined,
                                              color: Colors.orange,
                                            ),
                                            Text(
                                              "15 Minutes",
                                              style: TextStyle(
                                                color: Colors.orange,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FittedBox(
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: FittedBox(
                                            child: Text(
                                              "Uploaded on 22 Aug",
                                              style: TextStyle(
                                                color: Colors.green[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Image(
                                    image: AssetImage("assets/images/dino.png"),
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ))),
    );
  }

  @override
  void initState() {
    retrieveStringValue();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: currentWidget,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentindex,
            onTap: (index) {
              setState(() {
                currentindex = index;
              });
              loadScreen();
              setState(() {});
            },
            elevation: 0,
            selectedIconTheme: IconThemeData(
              color: Colors.red,
              size: 25,
            ),
            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25),
            selectedItemColor: Colors.red,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.assignment_turned_in_outlined),
                label: 'Tests',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.control_camera),
                label: 'Games',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.settings_outlined),
                label: 'Settings',
              ),
            ],
          )),
    ));
  }

  Widget TestScreen() {
    QuizPaperController _quizePprContoller = Get.find();
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen1.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/gamepage2.png'))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            // padding: const EdgeInsets.all(kMobileScreenPadding),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //       const SizedBox(height: 40),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            //         child: Builder(
            //           builder: (_) {
            //             final AuthController _auth = Get.find();
            //             final user = _auth.getUser();
            //             String _label = 'Hello mate';
            //             if (user != null) {
            //               _label = 'Hello ${user.displayName}';
            //             }
            //             return Text(_label,
            //                 style: TextStyle(
            //                     color: Colors.grey,
            //                     fontSize: 20,
            //                     fontWeight: FontWeight.bold));
            //           },
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Padding(
            //         padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            //         child: const Text("Let's Play  ",
            //             style: TextStyle(
            //                 color: Colors.black,
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.bold)),
            //       ),
            //       const SizedBox(height: 10),
            //     ],
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ContentArea(
                  addPadding: false,
                  child: Obx(
                    () => LiquidPullToRefresh(
                      height: 150,
                      springAnimationDurationInMilliseconds: 500,
                      color: Colors.red[100],
                      onRefresh: () async {
                        _quizePprContoller.getAllPapers();
                      },
                      child: ListView.separated(
                        padding: UIParameters.screenPadding,
                        shrinkWrap: true,
                        itemCount: _quizePprContoller.allPapers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return QuizPaperCard(
                            model: _quizePprContoller.allPapers[index],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 20);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
