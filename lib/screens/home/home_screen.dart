// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sih_2022/configs/configs.dart';
import 'package:sih_2022/controllers/article/piechart_controller.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/auth_and_profile/profile_screen.dart';
import 'package:sih_2022/screens/child/home.dart';
import 'package:sih_2022/screens/community/community_page.dart';
import 'package:sih_2022/screens/home/article_screen.dart/article_page.dart';
import 'package:sih_2022/screens/home/story_screen.dart';
import 'package:sih_2022/screens/mental_health/mental_health.dart';
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
        currentWidget = CommunityPage();

        break;

      case 3:
        // currentWidget = ArticlePage();
        break;
      case 2:
        setState(() {
          final cont = Get.put(PieChartController());
          cont.getAllData();
        });

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
                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         Get.offAllNamed(HomeScreen1.routeName);
                //       });
                //     },
                //     child: Text("hello World")),
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello Parent 👋",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      // InkWell(
                      //     onTap: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => TimeLinePage()));
                      //     },
                      //     child: Image(
                      //       image: AssetImage('assets/images/tim5.png'),
                      //       width: 40,
                      //       height: 40,
                      //     )),
                      InkWell(
                          onTap: () {
                            setState(() {
                              Get.offAllNamed(HomeScreen1.routeName);
                            });
                          },
                          child: Image(
                            image: AssetImage('assets/images/child_login.png'),
                            width: 40,
                            height: 40,
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
                    String _label = 'Mate';
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
                //card-1 for progress
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(243, 191, 194, 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentindex = 2;
                      });
                      loadScreen();
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 140,
                      width: 400,
                      child: Container(
                        width: 400 / 2.5,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "Your child's progress",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "45 minutes speent today",
                                    style: TextStyle(
                                        color: Color.fromARGB(182, 46, 46, 46),
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "15% progress",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
                                image: AssetImage("assets/images/box.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //card-2 community forum
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(194, 222, 249, 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentindex = 1;
                      });
                      loadScreen();
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 140,
                      width: 400,
                      child: Container(
                        width: 400 / 2.5,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "Commuity Forum",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "Move on to the world's largest community of parents",
                                    style: TextStyle(
                                        color: Color.fromARGB(182, 46, 46, 46),
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "278 unread messages",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
                                image: AssetImage("assets/images/group.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //card-3 for need expert guidance
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(205, 194, 153, 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ArticlePage()));
                      });
                      loadScreen();
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 160,
                      width: 400,
                      child: Container(
                        width: 400 / 2.5,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 220,
                                  child: Text(
                                    "Need expert guidance?",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Text(
                                    "Read articles on various topics written by experts from around the globe",
                                    style: TextStyle(
                                        color: Color.fromARGB(182, 46, 46, 46),
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "10 unread articles",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
                                image: AssetImage("assets/images/search.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // card-4 physical health
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(175, 220, 154, 1),
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
                        height: 140,
                        width: 400,
                        child: Container(
                          width: 400 / 2.5,
                          margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "Physical Health",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "Check out exercises you can do with your child",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(182, 46, 46, 46),
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "30 minutes spent today",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Image(
                                  image: AssetImage("assets/images/yoga.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //card-5 for mental health
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(139, 190, 238, 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HealthPage()));
                      });
                      loadScreen();
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 140,
                      width: 400,
                      child: Container(
                        width: 400 / 2.5,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "Mental Health",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "Let us help you with your child's mental issues",
                                    style: TextStyle(
                                        color: Color.fromARGB(182, 46, 46, 46),
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "15 questions asked",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
                                image:
                                    AssetImage("assets/images/mind_game.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //card-6 for timeline
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(250, 249, 224, 1),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TimeLinePage()));
                      });
                      loadScreen();
                      setState(() {});
                    },
                    child: SizedBox(
                      height: 140,
                      width: 400,
                      child: Container(
                        width: 400 / 2.5,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 200,
                                  child: Text(
                                    "Timeline",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: Text(
                                    "Let the growth timeline speak for your child's activities",
                                    style: TextStyle(
                                        color: Color.fromARGB(182, 46, 46, 46),
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: Text(
                                    "Last updated on 13th August",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black87),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image(
                                image: AssetImage("assets/images/timeline.png"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //card-7 for parental control
                Card(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  elevation: 5.00,
                  shadowColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  color: Color.fromRGBO(225, 225, 228, 1),
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
                        height: 140,
                        width: 400,
                        child: Container(
                          width: 400 / 2.5,
                          margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "Parental Controls",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: Text(
                                      "Monitor your child's screentime and other activities",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(182, 46, 46, 46),
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Text(
                                      "30 minutes spent today",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/parental.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    size: 30,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.groups_outlined,
                    size: 30,
                  ),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.person_outline,
                    size: 30,
                  ),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.white,
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 30,
                  ),
                  label: 'Settings',
                ),
              ],
            )));
  }

  Widget TestScreen() {
    QuizPaperController _quizePprContoller = Get.find();
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Scaffold(
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
      ),
    );
  }
}
