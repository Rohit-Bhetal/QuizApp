import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/dialog_manager.dart';
import '../../controller/question_data/question_paper_controller.dart';

class SideMenuController extends GetxController {
  final QuestionPaperController _questionPaperController = Get.find();
  Rxn<User>? user = Rxn();
  @override
  void onReady() {
    user!.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  Future<void> website(context) async {
    final Uri github = Uri.parse('https://github.com/Rohit-Bhetal');
    if (await canLaunchUrl(github)) {
      await launchUrl(github, mode: LaunchMode.externalApplication);
    } else {
      DialogManager.showErrorDialog(context, "Errro accessing the Github");
    }
  }

  Future<void> email(context) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'RohitBhetal103@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Request for Assistance - [Briefly describe the issue]',
        'body': 'Pin Screenshot Of your Problem'
      }),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      DialogManager.showErrorDialog(context, "Errro While Sending Mail");
    }
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
