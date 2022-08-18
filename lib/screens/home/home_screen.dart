// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:sih_2022/controllers/article/piechart_controller.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/auth_and_profile/profile_screen.dart';
import 'package:sih_2022/screens/child/home.dart';
import 'package:sih_2022/screens/community/community_page.dart';
import 'package:sih_2022/screens/home/article_screen.dart/article_page.dart';
import 'package:sih_2022/screens/home/settings_parent.dart';
import 'package:sih_2022/screens/mental_health/mental_health.dart';
import 'package:sih_2022/screens/timeline/timeline.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  bool islog = false;
  saveStringValue(bool name) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('childlof', name);
  }

  int currentindex = 0;
  late Widget currentWidget = homepage3();
  void loadScreen() {
    switch (currentindex) {
      case 0:
        currentWidget = homepage3();
        retrieveStringValue();
        break;
      case 1:
        currentWidget = CommunityPage();

        break;

      case 3:
        setState(() {
          currentWidget = ParentSettings();
        });

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
                      InkWell(
                          onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      "Enter the Password To Enter Child Mode"),
                                  actionsPadding: EdgeInsets.all(20),
                                  actions: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.5,
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
                                          print(password);
                                          print(newvalue);
                                          password == newvalue
                                              ? Get.offAllNamed(
                                                  HomeScreen1.routeName)
                                              : ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.red,
                                                      duration:
                                                          Duration(seconds: 2),
                                                      content: Text(
                                                        'Wrong Password',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )));
                                        },
                                        child: Text("Login")),
                                  ],
                                ),
                              ),
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
                        width: 400,
                        margin: EdgeInsets.fromLTRB(19, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
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
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      "45 minutes speent today",
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
                                    width: 180,
                                    child: Text(
                                      "15% progress",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                              Image(
                                image: AssetImage("assets/images/box.png"),
                              )
                            ],
                          ),
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
                        setState(() {});
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
                                      MediaQuery.of(context).size.width * 0.45,
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
  void initState() {
    retrieveStringValue();
    saveStringValue(islog);
    setState(() {});
    super.initState();
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
}
