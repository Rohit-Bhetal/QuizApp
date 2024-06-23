import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_quiz_app/constants/dialog_manager.dart';
import 'package:flutter_quiz_app/firebase_ref/firebase_ref.dart';
import 'package:flutter_quiz_app/screens/home/home_screen.dart';
import 'package:flutter_quiz_app/screens/intro/login_page.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  RxBool isLoading = false.obs;
  final _user = Rxn<User>();
  String? get currentUserName => firebaseUser.value?.displayName;
  String? photoUrl;

  @override
  void onReady() {
    initAuth();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginPage())
        : Get.offAll(() => const HomeScreen());
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      await _googleSignIn.signOut();
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      isLoading.value = true;
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credentials = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credentials);
        saveUser(account);
        photoUrl = firebaseUser.value!.photoURL;
        firebaseUser.value != null
            ? Get.offAll(() => HomeScreen())
            : Get.to(() => LoginPage());
        firebaseUser.value = _auth.currentUser;
      }
    } on Exception catch (error) {
      DialogManager.showErrorDialog(context, error);
    }
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  Future<void> logout() async => await _auth.signOut();

  User? getUser() {
    _user.value = _auth.currentUser!;
    return _user.value;
  }
}

  /*late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen(
      (User? user) {
        _user.value = user;
        user == null
            ? Get.offAll(() => LoginPage())
            : Get.offAll(() => HomeScreen());
      },
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      isLoading.value = true;
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credentials = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);

        await _auth.signInWithCredential(_credentials);
        saveUser(account);
        _user.value != null
            ? Get.offAll(() => HomeScreen())
            : Get.to(() => LoginPage());
      }
    } on Exception catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl
    });
  }

  void navigateToIntro() {
    Get.offAllNamed("/intro");
  }
}
*/