// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class ParentSettings extends StatefulWidget {
  ParentSettings({Key? key}) : super(key: key);

  @override
  State<ParentSettings> createState() => _ParentSettingsState();
}

class _ParentSettingsState extends State<ParentSettings> {
  final AuthController _auth = Get.find<AuthController>();
  late SharedPreferences _prefs;

  String name2 = "Enter Your Child Name";
  String childName = '';
  String langue = 'English';
  String newPass = "hello";
  String oldPass = '';
  String newPass2 = '';
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Switch Button is ON';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Switch Button is OFF';
      });
    }
  }

  saveStringValue2(String name) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('password', name);
  }

  // final controllerw = Get.put(ProfileController());
  saveStringValue(String name) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString('childname', name);
  }

  retrieveStringValue() async {
    _prefs = await SharedPreferences.getInstance();
    String? value = _prefs.getString("childname");
    setState(() {
      childName = value as String;
    });
    Future.delayed(Duration(seconds: 1));
    setState(() {});
  }

  final List<String> _mesaures = [
    'English',
    'Hindi',
    'Arabic',
    'Tamil',
    'Urdu',
  ];

  @override
  void initState() {
    retrieveStringValue();

    setState(() {});
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
        color: Colors.grey[200],
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 10, width: MediaQuery.of(context).size.width),
                  Text(
                    'Settings',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text("Change Kid's Name"),
                        actionsPadding: EdgeInsets.all(20),
                        actions: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            height: 80,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter Your Child Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  name2 = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                setState(() {
                                  saveStringValue(name2);
                                  retrieveStringValue();
                                  Navigator.pop(context, 'Cancel');
                                });
                              },
                              child: Text("Submit")),
                        ],
                      ),
                    ),
                    child: const Text(
                      "Change Kid's Name",
                      style: TextStyle(color: Colors.grey, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text(
                            'Set Your Prefered Language',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(width: 0.5),
                                  borderRadius: BorderRadius.circular(40)),
                              child: DropdownButton(
                                items: _mesaures
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 30.00,
                                              ),
                                              Text(value,
                                                  style: TextStyle(
                                                      fontSize: 20.00,
                                                      color: Colors.black)),
                                              SizedBox(
                                                width: 10.00,
                                              ),
                                            ],
                                          ),
                                          value: value,
                                        ))
                                    .toList(),
                                iconSize: 15,
                                elevation: 16,
                                icon: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 40,
                                ),
                                underline: Container(
                                  decoration: BoxDecoration(),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    langue = value as String;
                                  });
                                },
                                value: langue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Change Password for Child Mode",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            height: 45,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Current Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  oldPass = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.6,
                            height: 45,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'New Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  newPass2 = value;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              saveStringValue2(oldPass);
                              setState(() {});
                              oldPass.toString() == 'hello'
                                  ? showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text("Change Kid's Name"),
                                        actionsPadding: EdgeInsets.all(20),
                                        actions: <Widget>[
                                          Text("Password Changed Successfully"),
                                        ],
                                      ),
                                    )
                                  : showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                            title:
                                                const Text("Change Kid's Name"),
                                            actionsPadding: EdgeInsets.all(20),
                                            actions: <Widget>[
                                              Text("Wrong Current Password "),
                                            ],
                                          ));
                            },
                            child: Text(
                              "Set",
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 0.5),
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                elevation: 0,
                                backgroundColor: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Allowed Content",
                              style: TextStyle(
                                fontSize: 20,
                                // fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Games',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Transform.scale(
                                      scale: 1.5,
                                      child: Switch(
                                        onChanged: toggleSwitch,
                                        value: isSwitched,
                                        activeColor: Colors.red,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.red,
                                        inactiveTrackColor: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Games',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Transform.scale(
                                      scale: 1.5,
                                      child: Switch(
                                        onChanged: toggleSwitch,
                                        value: isSwitched,
                                        activeColor: Colors.red,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.red,
                                        inactiveTrackColor: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Games',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Transform.scale(
                                      scale: 1.5,
                                      child: Switch(
                                        onChanged: toggleSwitch,
                                        value: false,
                                        activeColor: Colors.red,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.red,
                                        inactiveTrackColor: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Games',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Transform.scale(
                                      scale: 1.5,
                                      child: Switch(
                                        onChanged: toggleSwitch,
                                        value: false,
                                        activeColor: Colors.red,
                                        activeTrackColor: Colors.grey,
                                        inactiveThumbColor: Colors.red,
                                        inactiveTrackColor: Colors.grey,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Text(
                      "Watch Tutorial Again",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
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
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
