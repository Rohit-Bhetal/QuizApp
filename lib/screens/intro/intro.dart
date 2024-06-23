import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import 'package:flutter_quiz_app/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'intro_widget.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late LiquidController controller;
  int current_index = 0;

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      current_index = activePageIndex;
    });
  }

  @override
  void initState() {
    controller = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [const Widget1(), const Widget2(), const Widget3()];
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: pages,
          onPageChangeCallback: onPageChangedCallback,
          liquidController: controller,
          slideIconWidget: const Icon(Icons.arrow_back_ios),
          enableSideReveal: true,
          enableLoop: false,
        ),
        current_index == 2
            ? Positioned(
                bottom: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.currentPage == 2) {
                      Get.offAndToNamed("/home");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      fixedSize: Size(100, 30),
                      shadowColor: Colors.grey,
                      backgroundColor: Colors.white),
                  child: Text(
                    "Let's get Started",
                    style:
                        GoogleFonts.nunito(fontSize: 10, color: Colors.black),
                  ),
                ))
            : SizedBox(),
        Positioned(
            top: 50,
            right: 20,
            child: current_index == 0 || current_index == 1
                ? TextButton(
                    onPressed: () {
                      controller.jumpToPage(page: 2);
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.nunito(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  )
                : const SizedBox()),
        Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const ScrollingDotsEffect(
                  activeDotColor: Color.fromARGB(255, 255, 255, 255),
                  dotHeight: 5.0),
            ))
      ],
    ));
  }
}
