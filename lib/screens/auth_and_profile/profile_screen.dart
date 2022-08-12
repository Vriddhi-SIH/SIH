// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_2022/configs/configs.dart';
import 'package:sih_2022/controllers/controllers.dart';
import 'package:sih_2022/screens/screens.dart';
import 'package:sih_2022/widgets/widgets.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = Get.find<AuthController>();
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(HomeScreen.routeName);
        return Future.delayed(Duration(microseconds: 0));
      },
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
                  padding: UIParameters.screenPadding.copyWith(top: 0),
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
              Expanded(
                child: Obx(
                  () => ContentArea(
                    addPadding: false,
                    child: ListView.separated(
                      padding: UIParameters.screenPadding,
                      itemCount: controller.allRecentTest.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return RecentQuizCard(
                            recentTest: controller.allRecentTest[index]);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
