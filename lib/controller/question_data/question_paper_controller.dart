//import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_quiz_app/services/firebase_storage_service.dart';
import 'package:get/get.dart';

import '../../firebase_ref/firebase_ref.dart';
import '../../models/question_model.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;
  final isLoadingData = false.obs;
  @override
  void onReady() {
    getAllPaper();
    super.onReady();
  }

  Future<void> getAllPaper() async {
    // List<String> imgName = ["maths", "accounting", "economics"];

    try {
      isLoadingData.value = true;
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs
          .map((paper) => QuestionPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl!;
      }
      allPapers.assignAll(paperList);
      isLoadingData.value = false;
    } catch (e) {
      print(e);
    }
  }
}
