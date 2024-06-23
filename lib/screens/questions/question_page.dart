// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_quiz_app/config/themes/ui_parameters.dart';
import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:flutter_quiz_app/models/question_model.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import 'package:flutter_quiz_app/screens/question_ui/question_paper.dart';
import 'package:flutter_quiz_app/screens/question_ui/question_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class QuestionSubjectPage extends StatelessWidget {
  final QuestionPaperModel model;
  const QuestionSubjectPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => const HomeScreen());
            },
            padding: const EdgeInsets.only(left: kDefaultPadding),
            icon: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Theme.of(context).colorScheme.background,
            )),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.3,
                  child: CachedNetworkImage(
                      width: 200,
                      height: 100,
                      imageUrl: model.imageUrl,
                      placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                              strokeWidth: 1,
                              color: Colors.grey,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          Image.asset("assets/images/errorImageCyan.png")),
                ),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 40),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 219, 219, 219),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(kDefaultPadding),
                        child: Text(
                          model.description,
                          style: Theme.of(context).textTheme.labelSmall,
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Get.toNamed(QuestionPaperScreen.routename,
                          arguments: model);
                    },
                    label: Text(
                      "  Start Now  ",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
