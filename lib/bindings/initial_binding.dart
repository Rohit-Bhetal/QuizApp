import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../controller/question_data/question_paper_controller.dart';
import '../services/firebase_storage_service.dart';

class IntialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(QuestionPaperController());
    Get.lazyPut(() => FirebaseStorageService());
  }
}
