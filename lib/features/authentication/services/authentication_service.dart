import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';

class EmailSignupService {
  static final firebaseAuth = FirebaseAuth.instance;

  static Future<void> signUp(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseAuth.currentUser != null) {
        await firebaseAuth.currentUser!.sendEmailVerification();
        await firebaseAuth.currentUser!.updateDisplayName(email);
        SnackbarUtil.showsnackbar(message: "Email verification sent");
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }

  static Future<void> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException {
      rethrow;
    }
  }

  static Future<String> sendOTP({required String phoneNumber}) async {
    final smsCompleter = Completer<String>();
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await firebaseAuth.signInWithCredential(phoneAuthCredential);
        },
        verificationFailed: (error) {
          SnackbarUtil.showsnackbar(message: error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          smsCompleter.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
    }
    final verificationid = await smsCompleter.future;
    return verificationid;
  }

  static Future<void> verifyOtp(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
    }
  }

  static Future<void> signinwithGoogle() async {
    try {
      final googleuser = await GoogleSignIn().signIn();
      if (googleuser == null) {
        return;
      }
      final authCredentials = await googleuser!.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: authCredentials.accessToken,
          idToken: authCredentials.idToken);
      await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      SnackbarUtil.showsnackbar(message: e.code);
    }
  }

  static Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
