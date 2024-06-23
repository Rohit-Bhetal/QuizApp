import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/question_data/data_uploader.dart';
import 'package:flutter_quiz_app/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  final DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Obx(() => Text(
              controller.loadingStatus.value == LoadingStatus.completed
                  ? "Uploading Completed"
                  : "Uploading"))),
    );
  }
}
