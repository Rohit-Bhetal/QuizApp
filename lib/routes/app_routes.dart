import 'package:flutter_quiz_app/controller/question_data/question_controller.dart';
import 'package:flutter_quiz_app/controller/question_data/question_paper_controller.dart';
import 'package:flutter_quiz_app/screens/intro/login_page.dart';
import 'package:flutter_quiz_app/screens/question_ui/question_paper.dart';
import 'package:flutter_quiz_app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

import '../screens/home/home_screen.dart';
import '../screens/intro/intro.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const LoginPage()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionPaperController());
            })),
        GetPage(
            name: QuestionPaperScreen.routename,
            page: () => const QuestionPaperScreen(),
            binding: BindingsBuilder(() {
              Get.put(QuestionController());
            })),
      ];
}
