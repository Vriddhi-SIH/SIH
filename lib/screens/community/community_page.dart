import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/controllers/controllers.dart';

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
  int currentindex = 0;
  late Widget currentWidget = CommunityPage();
  void loadScreen() {
    switch (currentindex) {
      case 0:
        currentWidget = CommunityPage();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter a search term',
                            ),
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Roll Number',
                      //     border: OutlineInputBorder(
                      //       borderSide: BorderSide(color: Colors.red),
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(15),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Text(
                      //   "Hello Little 👋 ",
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 18),
                      // ),
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
                    onTap: () => {
                      setState(() {
                        currentindex = 1;
                        loadScreen();
                      })
                    },
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
                                    width: 200,
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
                            SizedBox(
                                width: 200,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 200,
                                        child: Image(
                                          image: AssetImage(
                                              "assets/images/Avatars.jpeg"),
                                        ),
                                      )
                                    ]))

                            // Align(
                            //     alignment: Alignment.topLeft,
                            //     child:
                            //         Image.asset("assets/images/Avatars.jpeg"))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(appBar: null, body: Center(child: ListSearch())));
//   }
// }

// class ListSearch extends StatefulWidget {
//   ListSearchState createState() => ListSearchState();
// }

// class ListSearchState extends State<ListSearch> {
//   TextEditingController _textController = TextEditingController();

//   static List<String> mainDataList = [
//     "Apple",
//     "Apricot",
//     "Banana",
//     "Blackberry",
//     "Coconut",
//     "Date",
//     "Fig",
//     "Gooseberry",
//     "Grapes",
//     "Lemon",
//     "Litchi",
//     "Mango",
//     "Orange",
//     "Papaya",
//     "Peach",
//     "Pineapple",
//     "Pomegranate",
//     "Starfruit"
//   ];

//   // Copy Main List into New List.
//   List<String> newDataList = List.from(mainDataList);

//   onItemChanged(String value) {
//     setState(() {
//       newDataList = mainDataList
//           .where((string) => string.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         color: Color(0xfff5f5f5),
//         child: Container(
//             height: MediaQuery.of(context).size.height,
//             margin: EdgeInsets.fromLTRB(18, 20, 18, 0),
//             child: SingleChildScrollView(
//               child: Column(children: [
//                 SizedBox(
//                   height: 40,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 100,
//                         width: 300,
//                         child: Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: TextField(
//                             controller: _textController,
//                             decoration: InputDecoration(
//                               hintText: 'Search Here...',
//                             ),
//                             onChanged: onItemChanged,
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                           onTap: () {},
//                           child: Image(
//                             image: AssetImage('assets/images/tim5.png'),
//                             width: 40,
//                             height: 40,
//                           )),
//                       // Expanded(
//                       //   child: ListView(
//                       //     padding: EdgeInsets.all(12.0),
//                       //     children: newDataList.map((data) {
//                       //       return Container(
//                       //           child: ListTile(
//                       //         title: Text(data),
//                       //         onTap: () => print(data),
//                       //       ));
//                       //     }).toList(),
//                       //   ),
//                       // )
//                       // TextFormField(
//                       //   decoration: InputDecoration(
//                       //     labelText: 'Roll Number',
//                       //     border: OutlineInputBorder(
//                       //       borderSide: BorderSide(color: Colors.red),
//                       //       borderRadius: BorderRadius.all(
//                       //         Radius.circular(15),
//                       //       ),
//                       //     ),
//                       //   ),
//                       // ),
//                       // Text(
//                       //   "Hello Little 👋 ",
//                       //   style: TextStyle(
//                       //       color: Colors.grey,
//                       //       fontWeight: FontWeight.bold,
//                       //       fontSize: 18),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Builder(
//                   builder: (_) {
//                     final AuthController _auth = Get.find();
//                     final user = _auth.getUser();
//                     String _label = 'Mate';
//                     if (user != null) {
//                       _label = '${user.displayName}';
//                     }
//                     return Align(
//                       alignment: Alignment.topLeft,
//                       child: Text(_label,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 30)),
//                     );
//                   },
//                 ),
//                 Card(
//                   margin: EdgeInsets.fromLTRB(0, 30, 0, 10),
//                   elevation: 5.00,
//                   shadowColor: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30)),
//                   color: Colors.white,
//                   child: InkWell(
//                     onTap: () => {setState(() {})},
//                     child: SizedBox(
//                       height: 120,
//                       width: 400,
//                       child: Container(
//                         margin: EdgeInsets.fromLTRB(19, 0, 0, 5),
//                         child: Row(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
//                               child: Image(
//                                 image: AssetImage(
//                                     "assets/images/Rectangle 24.jpeg"),
//                               ),
//                             ),
//                             SizedBox(
//                               width: 200,
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     width: 200,
//                                     child: Text(
//                                       "Why does my child asks a lot of questions?",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 15),
//                                     ),
//                                   ),

//                                   Text(
//                                     "development cognitive",
//                                     style: TextStyle(
//                                       color: Colors.grey[700],
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 8,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     "244,564 Views  10,920 Likes  184 answers",
//                                     style: TextStyle(
//                                       color: Colors.grey[700],
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 8,
//                                     ),
//                                   ),

//                                   // Text(
//                                   //   'Lets do it!!',
//                                   //   style: TextStyle(
//                                   //       color: Colors.orange,
//                                   //       fontSize: 18,
//                                   //       fontWeight: FontWeight.bold),
//                                   // )
//                                 ],
//                               ),
//                             ),
//                             Image(
//                               image: AssetImage("assets/images/Avatars.jpeg"),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ]),
//             )));
//   }
// }

// class Screen2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(appBar: null, body: Center(child: ListSearch())));
//   }
// }

// // class ListSearch1 extends StatefulWidget {
// //   ListSearchState1 createState() => ListSearchState1();
// // }

// class ListSearchState1 extends State<ListSearch> {
//   TextEditingController _textController = TextEditingController();

//   static List<String> mainDataList = [
//     "Apple",
//     "Apricot",
//     "Banana",
//     "Blackberry",
//     "Coconut",
//     "Date",
//     "Fig",
//     "Gooseberry",
//     "Grapes",
//     "Lemon",
//     "Litchi",
//     "Mango",
//     "Orange",
//     "Papaya",
//     "Peach",
//     "Pineapple",
//     "Pomegranate",
//     "Starfruit"
//   ];

//   // Copy Main List into New List.
//   List<String> newDataList = List.from(mainDataList);

//   onItemChanged(String value) {
//     setState(() {
//       newDataList = mainDataList
//           .where((string) => string.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 hintText: 'Search Here...',
//               ),
//               onChanged: onItemChanged,
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(12.0),
//               children: newDataList.map((data) {
//                 return ListTile(
//                   title: Text(data),
//                   onTap: () => print(data),
//                 );
//               }).toList(),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// // Search bar in app bar flutter
// class SearchAppBar extends StatefulWidget {
//   @override
//   _SearchAppBarState createState() => new _SearchAppBarState();
// }

// class _SearchAppBarState extends State<SearchAppBar> {
//   Widget appBarTitle = new Text("AppBar Title");
//   Icon actionIcon = new Icon(Icons.search);
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar:
//           new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
//         new IconButton(
//           icon: actionIcon,
//           onPressed: () {
//             setState(() {
//               if (this.actionIcon.icon == Icons.search) {
//                 this.actionIcon = new Icon(Icons.close);
//                 this.appBarTitle = new TextField(
//                   style: new TextStyle(
//                     color: Colors.white,
//                   ),
//                   decoration: new InputDecoration(
//                       prefixIcon: new Icon(Icons.search, color: Colors.white),
//                       hintText: "Search...",
//                       hintStyle: new TextStyle(color: Colors.white)),
//                 );
//               } else {
//                 this.actionIcon = new Icon(Icons.search);
//                 this.appBarTitle = new Text("AppBar Title");
//               }
//             });
//           },
//         ),
//       ]),
//     );
//   }
// }
