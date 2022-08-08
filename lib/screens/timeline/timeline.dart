// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import 'package:sih_2022/controllers/timeline/timeline_controller.dart';
import 'package:timelines/timelines.dart';

TextStyle st(Color colors) {
  return TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: colors);
}

class TimeLinePage extends StatelessWidget {
  TimeLinePage({Key? key}) : super(key: key);
  static const routeName = "/timeline";

  final Controller = Get.put(TimeLineController());

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amber[100],
      child: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              color: Color.fromARGB(255, 255, 242, 204),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "The Growth TimeLine",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Text(
                      "Pull Down To Refresh",
                      style: TextStyle(color: Colors.amber),
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
                Controller.getAllData();
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
                          // : Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //         Padding(
                          //           padding:
                          //               const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          //           child: Text(
                          //             "${Controller.productData[index].timeline}",
                          //             style: TextStyle(
                          //                 fontSize: 20,
                          //                 fontWeight: FontWeight.bold),
                          //           ),
                          //         )
                          //       ]),
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
