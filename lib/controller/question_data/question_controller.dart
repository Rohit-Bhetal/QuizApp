import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/question_data/question_paper_controller.dart';
import 'package:flutter_quiz_app/firebase_ref/firebase_ref.dart';
import 'package:flutter_quiz_app/firebase_ref/loading_status.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  final questionIndex = 0.obs;
  bool get isfirstQuestion => questionIndex.value > 0;
  bool get isLastQuestion => questionIndex.value >= allQuestions.length - 1;
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  @override
  void onReady() {
    final questionPaper = Get.arguments as QuestionPaperModel;
    print(questionPaper.title);
    loadData(questionPaper);

    super.onReady();
  }

  Future<void> loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    loadingStatus.value = LoadingStatus.loading;
    try {
      // ignore: unused_local_variable
      final QuerySnapshot<Map<String, dynamic>> questionQueries =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();
      // ignore: unused_local_variable
      final finalQuestions = questionQueries.docs
          .map((snapshot) => Questions.fromSnapShot(snapshot))
          .toList();
      questionPaper.questions = finalQuestions;

      for (Questions _questions in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answerQueries =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_questions.id)
                .collection("answers")
                .get();
        final answers = answerQueries.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        _questions.answers = answers;

        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
          currentQuestion.value = questionPaper.questions![0];
          print(currentQuestion.toString());
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void selectedQuestionAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['question_list_answer']);
  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length) {
      return;
    }
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void previousQuestion() {
    if (questionIndex.value <= 0) {
      return;
    }
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }
}
