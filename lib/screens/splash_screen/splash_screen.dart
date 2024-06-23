import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants/icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Theme.of(context).colorScheme.primary,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropShadowImage(
                  offset: const Offset(10, 10),
                  scale: 1,
                  blurRadius: 12,
                  borderRadius: 20,
                  image: Image.asset(
                    AppIcons.logo,
                    width: 100,
                    height: 100,
                  )),
              const SizedBox(
                height: 10,
              ),
              Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: Colors.black,
                  highlightColor: Colors.grey,
                  child: Text("Q u i z W i z C A",
                      style: GoogleFonts.nunito(
                          fontSize: 30.0, fontWeight: FontWeight.w400)))
            ],
          )),
    );
  }
}
