import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants/dialog_manager.dart';
import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Welcome \nQuizWizCA",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    Obx(
                      () => controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              height: 330,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 15.0),
                                child: Lottie.asset(
                                    "assets/icons/loginAnimation.json"),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: FloatingActionButton.extended(
                    onPressed: () async {
                      try {
                        await controller.signInWithGoogle(context).whenComplete(
                            () => controller.isLoading.value = false);
                      } catch (error) {
                        DialogManager.showErrorDialog(context, error);
                      }
                    },
                    icon: SvgPicture.asset(
                      "assets/icons/google.svg",
                      height: 30,
                      width: 30,
                    ),
                    label: Text(
                      "Google Login",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Need Help?",
                      style: GoogleFonts.oswald(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.red),
                    ),
                  ))
                ],
              ),
            )
          ],
        ));
  }
}
