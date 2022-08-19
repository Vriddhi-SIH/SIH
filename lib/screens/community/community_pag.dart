// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:sih_2022/screens/screens.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<String> _choices = ["Cognitive", "Psychomotor", "Affective"];
  List<String> _q1 = ["development", "cognitive"];
  int _choiceIndex = 0;
  int _q1Index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
          color: Color(0xfff5f5f5),
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
                        Container(
                          height: 100,
                          width: 300,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/files.jpeg'),
                              width: 40,
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Community Forum',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/plus.jpeg'),
                              width: 40,
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 30,
                    width: 600,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: _choices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          label: Text(_choices[index]),
                          selected: _choiceIndex == index,
                          selectedColor: Color(0xffff6464),
                          onSelected: (bool selected) {
                            setState(() {
                              _choiceIndex = selected ? index : 0;
                            });
                            index == 0
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Screen2()))
                                : (index == 1
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen3()))
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen4())));
                          },
                          backgroundColor: Color(0xffffffff),
                          //  labelStyle: TextStyle(color: Color(0xffff6464)),
                          labelStyle: TextStyle(
                              color: _choiceIndex == index
                                  ? Color(0xffffffff)
                                  : Color(0xffff6464),
                              fontSize: 17),
                        );
                      },
                    ),
                  ),
                  // Align(
                  //       alignment: Alignment.topLeft,
                  //       child: Text('Community Forum',
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 30)),
                  // ),

                  Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                      elevation: 5.00,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.white,
                      child: InkWell(
                        onTap: () => {setState(() {})},
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Align(
                              //     alignment: Alignment.topCenter,
                              //     child: Image.asset(
                              //         "assets/images/Rectangle 24.jpeg")),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/Rectangle 24.jpeg"),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      //MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        "Why does my child asks a lot of questions?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 180,
                                      child: ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 5,
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _q1.length,
                                        itemBuilder:
                                            (BuildContext context, int index1) {
                                          return ChoiceChip(
                                            label: Text(_q1[index1]),
                                            selected: _q1Index == index1,
                                            selectedColor: Color(0xfff4f6f8),
                                            onSelected: (bool selected) {
                                              setState(() {
                                                _q1Index =
                                                    selected ? index1 : 0;
                                              });
                                            },
                                            backgroundColor: Color(0xfff4f6f8),
                                            //  labelStyle: TextStyle(color: Color(0xffff6464)),
                                            labelStyle: TextStyle(
                                                color: Color(0xff858ead),
                                                fontSize: 9),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "244,564 Views  10,920 Likes  184 answers",
                                      style: TextStyle(
                                        color: Color(0xff858ead),
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/Avatars.jpeg"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  // int currentindex = 0;
  // late Widget currentWidget = Screen2();
  // void loadScreen() {
  //   switch (currentindex) {
  //     case 0:
  //       currentWidget = Screen2();
  //       break;
  //   }
  // }
  // GlobalKey<ScaffoldState> _key;
  // bool _isSelected;
  // List<CompanyWidget> _companies;
  // List<String> _filters;
  List<String> _choices = ["Cognitive", "Psychomotor", "Affective"];
  List<String> _q1 = ["development", "cognitive"];
  int _choiceIndex = 1;
  int _q1Index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
          color: Color(0xfff5f5f5),
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
                        Container(
                          height: 100,
                          width: 300,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/files.jpeg'),
                              width: 40,
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Community Forum2',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/plus.jpeg'),
                              width: 40,
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 30,
                    width: 600,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: _choices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          label: Text(_choices[index]),
                          selected: _choiceIndex == index,
                          selectedColor: Color(0xffff6464),
                          onSelected: (bool selected) {
                            setState(() {
                              _choiceIndex = selected ? index : 0;
                            });
                            index == 0
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Screen2()))
                                : (index == 1
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen3()))
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen4())));
                          },
                          backgroundColor: Color(0xffffffff),
                          //  labelStyle: TextStyle(color: Color(0xffff6464)),
                          labelStyle: TextStyle(
                              color: _choiceIndex == index
                                  ? Color(0xffffffff)
                                  : Color(0xffff6464),
                              fontSize: 17),
                        );
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    elevation: 5.00,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => {setState(() {})},
                      child: SizedBox(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 35),
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/Rectangle 24.jpeg"),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),

                                    Container(
                                      width: 300,
                                      //MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        "Why does my child asks a lot of questions?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 10,
                                    ),

                                    Container(
                                      height: 30,
                                      width: 600,
                                      child: ListView.separated(
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            width: 5,
                                          );
                                        },
                                        scrollDirection: Axis.horizontal,
                                        itemCount: _q1.length,
                                        itemBuilder:
                                            (BuildContext context, int index1) {
                                          return ChoiceChip(
                                            label: Text(_q1[index1]),
                                            selected: _q1Index == index1,
                                            selectedColor: Color(0xfff4f6f8),
                                            onSelected: (bool selected) {
                                              setState(() {
                                                _q1Index =
                                                    selected ? index1 : 0;
                                              });
                                            },
                                            backgroundColor: Color(0xfff4f6f8),
                                            //  labelStyle: TextStyle(color: Color(0xffff6464)),
                                            labelStyle: TextStyle(
                                                color: Color(0xff858ead),
                                                fontSize: 9),
                                          );
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "244,564 Views  10,920 Likes  184 answers",
                                      style: TextStyle(
                                        color: Color(0xff858ead),
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 9,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    //   child: Image(
                                    //     image: AssetImage(
                                    //         "assets/images/Avatars.jpeg"),
                                    //   ),
                                    // ),

                                    // Text(
                                    //   'Lets do it!!',
                                    //   style: TextStyle(
                                    //       color: Colors.orange,
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.bold),
                                    // )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(50, 0, 0, 60),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/Avatars.jpeg"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }
}

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  List<String> _choices = ["Cognitive", "Psychomotor", "Affective"];
  int _choiceIndex = 2;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
      child: Material(
          color: Color(0xfff5f5f5),
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
                        Container(
                          height: 100,
                          width: 300,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter a search term',
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/files.jpeg'),
                              width: 40,
                              height: 40,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text('Community Forum3',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image(
                              image: AssetImage('assets/images/plus.jpeg'),
                              width: 40,
                              height: 40,
                            )),
//                         ChoiceChip(
//   label: Text(_choices[index]),
//   selected: _choiceIndex == index,
//   selectedColor: Colors.red,
//   onSelected: (bool selected) {
//     setState(() {
//       _choiceIndex = selected ? index : 0;
//     });
//   },
//   backgroundColor: Colors.green,
//   labelStyle: TextStyle(color: Colors.white),
// ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 30,
                    width: 600,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 5,
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: _choices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChoiceChip(
                          label: Text(_choices[index]),
                          selected: _choiceIndex == index,
                          selectedColor: Color(0xffff6464),
                          onSelected: (bool selected) {
                            setState(() {
                              _choiceIndex = selected ? index : 0;
                            });
                            index == 0
                                ? Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Screen2()))
                                : (index == 1
                                    ? Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen3()))
                                    : Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Screen4())));
                          },
                          backgroundColor: Color(0xffffffff),
                          //  labelStyle: TextStyle(color: Color(0xffff6464)),
                          labelStyle: TextStyle(
                              color: _choiceIndex == index
                                  ? Color(0xffffffff)
                                  : Color(0xffff6464),
                              fontSize: 17),
                        );
                      },
                    ),
                  ),
                  // Align(
                  //       alignment: Alignment.topLeft,
                  //       child: Text('Community Forum',
                  //           style: TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 30)),
                  // ),
                  Card(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    elevation: 5.00,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => {setState(() {})},
                      child: SizedBox(
                        height: 120,
                        width: 600,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(19, 0, 0, 5),
                          child: Row(
                            children: [
                              // Align(
                              //     alignment: Alignment.topCenter,
                              //     child: Image.asset(
                              //         "assets/images/Rectangle 24.jpeg")),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 10, 20),
                                child: Image(
                                  image: AssetImage(
                                      "assets/images/Rectangle 24.jpeg"),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 400,
                                      //MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        "Why does my child asks a lot of questions?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),

                                    Text(
                                      "development cognitive",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "244,564 Views  10,920 Likes  184 answers",
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    //   child: Image(
                                    //     image: AssetImage(
                                    //         "assets/images/Avatars.jpeg"),
                                    //   ),
                                    // ),

                                    // Text(
                                    //   'Lets do it!!',
                                    //   style: TextStyle(
                                    //       color: Colors.orange,
                                    //       fontSize: 18,
                                    //       fontWeight: FontWeight.bold),
                                    // )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 50),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/Avatars.jpeg"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ))),
    );
  }
}
