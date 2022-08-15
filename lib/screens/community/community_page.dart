// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sih_2022/controllers/controllers.dart';

import 'package:sih_2022/screens/home/home_screen.dart';

class CommunityPage extends StatefulWidget {
  CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

// class _CommunityPageState extends State<CommunityPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: Center(
//         child: Text("hello World"),
//       ),
//     );
//   }
// }

class _CommunityPageState extends State<CommunityPage> {
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
                              image: AssetImage('assets/images/tim5.png'),
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
                  Card(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
                    elevation: 5.00,
                    shadowColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () => {setState(() {})},
                      child: SizedBox(
                        height: 120,
                        width: 400,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(19, 0, 0, 5),
                          child: Row(
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(
                                      "assets/images/Rectangle 24.jpeg")),
                              // Padding(
                              //   padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
                              //   child: Image(
                              //     image: AssetImage(
                              //         "assets/images/Rectangle 24.jpeg"),
                              //   ),
                              // ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
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
