import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:Aura/app/app.dart';
import 'package:Aura/app/services/database_service.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../widgets/error_dialog.dart';

class AuthController extends GetxController {
  DatabaseService db = DatabaseService();
  final Rx<User?> firebaseUser = Rx<User?>(null);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => firebaseUser.value;

  @override
  void onInit() {
    firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      showLoadingDialog(message: "Signing In...");
      await _auth.signInWithEmailAndPassword(email: email, password: password);
       Fluttertoast.showToast(msg: "Sign In", gravity: ToastGravity.BOTTOM);
      hideLoadingDialog();
    } on TimeoutException catch (timeoutError) {
      hideLoadingDialog();
      showErrorDialog("Request Timed out");
    } on Exception catch (err) {
      hideLoadingDialog();
      showErrorDialog(err.toString());
    }
  }

  Future<void> signUpWithEmailAndPassword({
    required String username,
    required String emailAddress,
    required String password,
  }) async {
    showLoadingDialog(message: "Signing Up");
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      UserModel user = UserModel(
        uid: cred.user!.uid,
        userName: username,
        emailaddress: emailAddress,
      );
      await db.userCollection.doc(cred.user!.uid).set(user);
      hideLoadingDialog();
      Fluttertoast.showToast(msg: "Sign Up", gravity: ToastGravity.BOTTOM);
    } on FirebaseAuthException catch (e) {
      hideLoadingDialog();
      showErrorDialog(e.toString());
      return;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
