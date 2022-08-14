// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:sih_2022/controllers/timeline/timeline_controller.dart';
import 'package:sih_2022/screens/timeline/m.dart';
import 'package:timelines/timelines.dart';
import 'package:transliteration/response/transliteration_response.dart';
import 'package:transliteration/transliteration.dart';

TextStyle st(Color colors) {
  return TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: colors);
}

class TimeLinePage extends StatelessWidget {
  TimeLinePage({Key? key}) : super(key: key);
  static const routeName = "/timeline";

  final Controller = Get.put(TimeLineController());
  Future<String> setHindi(Languages lan, String text) async {
    TransliterationResponse? _response =
        await Transliteration.transliterate(text, lan);

    return lan == Languages.ENGLISH
        ? text
        : _response!.transliterationSuggestions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Card(
            elevation: 0,
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "The Growth Timeline",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                          color: Colors.black),
                    ).translate(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ElevatedButton(
                        //     onPressed: () async {
                        //       Future.delayed(Duration(milliseconds: 10));
                        //       Controller.getAllData("timelines2");
                        //     },
                        //     child: Text("Hindi")),
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // ElevatedButton(
                        //     onPressed: () {
                        //       Future.delayed(Duration(milliseconds: 10));
                        //       Controller.getAllData("timelines");
                        //     },
                        //     child: Text("English")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: LiquidPullToRefresh(
              color: Colors.redAccent,
              onRefresh: () async {
                Future.delayed(Duration(milliseconds: 1));
                Controller.getAllData(lan);
              },
              animSpeedFactor: 3,
              child: GetBuilder<TimeLineController>(builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TimelineTile(
                      mainAxisExtent: 150,
                      oppositeContents: index % 2 == 0
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '${Controller.productData[index].title}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent),
                                    textAlign: TextAlign.right,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '${Controller.productData[index].timeline}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.orange[700]),
                                  ),
                                ],
                              ),
                            )
                          : null,
                      contents: index % 2 != 0
                          ? Container(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${Controller.productData[index].title}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    '${Controller.productData[index].timeline}',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.green[600]),
                                  ),
                                ],
                              ),
                            )
                          : null,
                      node: TimelineNode(
                          indicator: DotIndicator(
                            color: Colors.blue,
                            size: 30,
                          ),
                          startConnector: SolidLineConnector(
                            thickness: 7,
                            color: Colors.green,
                          ),
                          endConnector: VerticalDivider(
                            color: Colors.red,
                            thickness: 7,
                          )),
                    );
                    // return Container(
                    //   child: Text("Hello world"),
                    // );
                  },
                  itemCount: Controller.productData.length,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
