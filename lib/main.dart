import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bindings/initial_binding.dart';
import 'firebase_options.dart';
import 'routes/app_routes.dart';
import 'package:google_translator/google_translator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initFireBase();
  InitialBinding().dependencies();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // final String apiKey = "AIzaSyB2QG0lFPAddQAjAe8mfpTEE1lFki7mFtU";
  final String apiKey = "f28540fe83msh7959b80dac26f8dp155f3cjsncacc7b69d352";
  @override
  Widget build(BuildContext context) {
    return GoogleTranslatorInit(apiKey,
        automaticDetection: true,
        translateFrom: const Locale('en'),
        translateTo: const Locale('hi'),
        cacheDuration: const Duration(days: 13),
        builder: () => GetMaterialApp(
              theme: ThemeData(fontFamily: 'Nunito'),
              navigatorKey: navigatorKey,
              title: 'Flutter Demo',
              getPages: AppRoutes.pages(),
              debugShowCheckedModeBanner: false,
            ));
  }
}

Future<void> initFireBase() async {
  await Firebase.initializeApp(
    name: 'sih_2022-demo',
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initFireBase();
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }
