import 'package:get/get.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/screens/screens.dart';
import 'package:quizzle/screens/splash/splash.dart';
import 'package:quizzle/services/notification/notification_service.dart';

import '../services/firebase/firebasestorage_service.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    //Get.put(PapersDataUploader());

    Get.put(AuthController(), permanent: true);

    Get.put(NotificationService());
    Get.lazyPut(() => FireBaseStorageService());
  }
}
