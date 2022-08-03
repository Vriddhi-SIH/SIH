import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/widgets/widgets.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final AuthController _auth = Get.find<AuthController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
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
                          color: Colors.grey,
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
                          onPressed: () {
                            _auth.getUser() == null
                                ? Get.find<AuthController>().navigateToLogin()
                                : Get.find<AuthController>().signOut();
                          },
                          child: Text(
                              _auth.getUser() == null ? "Sign In" : "Sign Out",
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
    );
  }
}
