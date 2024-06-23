import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/config/themes/ui_parameters.dart';
import 'package:flutter_quiz_app/controller/question_data/question_controller.dart';
import 'package:flutter_quiz_app/firebase_ref/loading_status.dart';
import 'package:flutter_quiz_app/screens/question_ui/commonWidgets/background_decoration.dart';
import 'package:flutter_quiz_app/screens/question_ui/commonWidgets/question_widget/answer_card.dart';
import 'package:flutter_quiz_app/screens/question_ui/question_holder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class QuestionPaperScreen extends GetView<QuestionController> {
  const QuestionPaperScreen({super.key});
  static String routename = '/QuestionPaper';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.background,
                  Theme.of(context).colorScheme.tertiary
                ]),
          )),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: FaIcon(FontAwesomeIcons.arrowLeft)),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.background,
                  Theme.of(context).colorScheme.tertiary
                ]),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ContentQuiz(context),
              ),
            ),
          ),
        )
        //ContentQuiz(context),
        );
  }

  // ignore: non_constant_identifier_names
  Obx ContentQuiz(BuildContext context) {
    return Obx(() => Column(
          children: [
            if (controller.loadingStatus.value == LoadingStatus.loading)
              Expanded(child: Container(child: QuestionHolder())),
            if (controller.loadingStatus.value == LoadingStatus.completed)
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.all(kDefaultPadding),
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Text(controller.currentQuestion.value!.question,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background)),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<QuestionController>(
                            id: 'question_list_answer',
                            builder: (context) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                            height: 10,
                                          ),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers![index];
                                    return AnswerCard(
                                      answer:
                                          ' ${answer.identifier}.${answer.answer}',
                                      onTap: () => {
                                        controller.selectedQuestionAnswer(
                                            answer.identifier)
                                      },
                                      isSelected: answer.identifier ==
                                          controller.currentQuestion.value!
                                              .selectedAnswer,
                                    );
                                  },
                                  itemCount: controller
                                      .currentQuestion.value!.answers!.length);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ColoredBox(
              color: Theme.of(context).colorScheme.primary,
              child: Row(children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: controller.loadingStatus.value ==
                          LoadingStatus.completed,
                      child: SizedBox(
                        height: 55,
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton.icon(
                                onPressed: () {
                                  controller.nextQuestion();
                                },
                                icon: FaIcon(FontAwesomeIcons.chevronRight,
                                    color: Colors.black),
                                label: Text(
                                  controller.isLastQuestion ? "Submit" : "Next",
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ))),
                      ),
                    ),
                  ),
                )
              ]),
            )
          ],
        ));
  }
}
