// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/question_data/question_paper_controller.dart';

class QuestionPaperUi extends StatelessWidget {
  final int index;
  final QuestionPaperController _questionPaperController = Get.find();
  QuestionPaperUi({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Text(_questionPaperController.allPapers[index].questions as String),
      ),
    );
  }
}
