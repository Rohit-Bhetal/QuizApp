import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/config/themes/app_light_themes.dart';
import 'package:flutter_quiz_app/config/themes/ui_parameters.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import 'package:flutter_quiz_app/screens/home/search_box.dart';
import 'package:flutter_quiz_app/screens/questions/question_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../controller/question_data/question_paper_controller.dart';
import 'cards_body.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(kDefaultPadding),
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.4)),
          child: TextField(
            readOnly: true,
            onTap: (() => Get.to(() => SearchBox(), popGesture: true)),
            // onChanged: onChanged,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                suffix: const FaIcon(FontAwesomeIcons.magnifyingGlass),
                suffixIconColor: Theme.of(context).colorScheme.background,
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
              ),
              Obx(() {
                if (_questionPaperController.isLoadingData.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ), // Display a circular progress indicator
                  );
                } else {
                  return ListView.separated(
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                              () => QuestionSubjectPage(
                                    model: _questionPaperController
                                        .allPapers[index],
                                  ),
                              popGesture: true);
                        },
                        child: BoxCards(
                          model: _questionPaperController.allPapers[index],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: _questionPaperController.allPapers.length,
                  );
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
