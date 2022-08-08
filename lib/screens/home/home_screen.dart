// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sih_2022/configs/configs.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/auth_and_profile/profile_screen.dart';
import 'package:sih_2022/screens/home/article_screen.dart/article_page.dart';
import 'package:sih_2022/screens/home/story_screen.dart';
import 'package:sih_2022/screens/timeline/timeline.dart';
import 'package:sih_2022/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  late Widget currentWidget = homepage3();
  void loadScreen() {
    switch (currentindex) {
      case 0:
        currentWidget = homepage3();
        break;
      case 1:
        currentWidget = TestScreen();

        break;

      case 2:
        currentWidget = ArticlePage();
        break;
      case 3:
        Get.lazyPut(() => ProfileController());
        currentWidget = ProfileScreen();
        break;
    }
  }

  Widget homepage3() {
    return Material(
        color: Colors.white,
        child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.fromLTRB(18, 20, 18, 0),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello Little 👋 ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TimeLinePage()));
                          },
                          child: Icon(
                            Icons.calendar_month,
                            size: 40,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Builder(
                  builder: (_) {
                    final AuthController _auth = Get.find();
                    final user = _auth.getUser();
                    String _label = 'Hello mate';
                    if (user != null) {
                      _label = '${user.displayName}';
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
                Card(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Colors.pink[100],
                  child: InkWell(
                    onTap: () => {},
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentindex = 3;
                        });
                        loadScreen();
                        setState(() {});
                      },
                      child: SizedBox(
                        height: 120,
                        width: 400,
                        child: Container(
                          width: 400 / 2,
                          margin: EdgeInsets.fromLTRB(19, 5, 8, 5),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Builder(
                                    builder: (_) {
                                      final AuthController _auth = Get.find();
                                      final user = _auth.getUser();
                                      String _label = '  Hello mate';
                                      if (user != null) {
                                        _label = '${user.displayName}';
                                      }
                                      return Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(_label,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Latest Activities",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                                child: Image.asset("assets/images/boy.png"),
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
                  color: Colors.blue[100],
                  child: InkWell(
                    onTap: () => {
                      setState(() {
                        currentindex = 1;
                        loadScreen();
                      })
                    },
                    child: SizedBox(
                      height: 150,
                      width: 400,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(19, 5, 8, 5),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 400 / 2,
                              child: Column(
                                children: [
                                  Text(
                                    "Let's Play",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Hello My name is ayush Kumar Singh and I",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(),
                              child: Image.asset("assets/images/play.png"),
                            )
                          ],
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
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => StoryPage()))
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
                              width: (3 * 400) / 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Story Of Baby Dinosaur",
                                    style: TextStyle(
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "15 Minutes",
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
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
                              padding: EdgeInsets.only(),
                              child: Image(
                                image: AssetImage("assets/images/dino.png"),
                                width: 162.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
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
                  icon: Icon(Icons.auto_stories_outlined),
                  label: 'Articles',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            )));
  }

  Widget TestScreen() {
    QuizPaperController _quizePprContoller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(kMobileScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Builder(
                    builder: (_) {
                      final AuthController _auth = Get.find();
                      final user = _auth.getUser();
                      String _label = 'Hello mate';
                      if (user != null) {
                        _label = 'Hello ${user.displayName}';
                      }
                      return Text(_label,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: const Text("Let's Play  ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
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
    );
  }
}
