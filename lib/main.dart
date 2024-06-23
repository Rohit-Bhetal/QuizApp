import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_quiz_app/bindings/initial_binding.dart';
import 'package:flutter_quiz_app/config/themes/app_light_themes.dart';
import 'package:flutter_quiz_app/controller/auth_controller.dart';
import 'package:flutter_quiz_app/firebase_options.dart';
import 'package:flutter_quiz_app/routes/app_routes.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthController()));
  IntialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeClass.lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: ThemeClass.darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
