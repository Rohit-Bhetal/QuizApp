import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/config/themes/app_dark_themes.dart';
import 'package:flutter_quiz_app/config/themes/app_light_themes.dart';
import 'package:flutter_quiz_app/controller/question_data/question_paper_controller.dart';
import 'package:flutter_quiz_app/screens/home/body.dart';
import 'package:flutter_quiz_app/screens/home/box_sidemenu.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Dashboard',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
          actions: [SideBox()],
        ),
        body: Body());
  }
}

/* Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            child: SizedBox(
              height: 200,
              width: 200,
              child: CachedNetworkImage(
                width: 100,
                height: 100,
                imageUrl: _questionPaperController.allPapers[index].imageUrl,
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/image11.png"),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: _questionPaperController.allPapers.length,
      ),
    )
    // Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: shimmerCard())
    */
Widget shimmerCard() {
  return Container(
    color: Colors.white,
  );
}
