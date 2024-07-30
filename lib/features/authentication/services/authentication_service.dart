import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';

class EmailSignupService {
  static final firebaseAuth = FirebaseAuth.instance;

  static Future<void> signUp(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.currentUser!.sendEmailVerification();
      await firebaseAuth.currentUser!.updateDisplayName(email);
      SnackbarUtil.showsnackbar(message: "Email verification sent");
    }
  }

  static Future<void> signIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  static Future<String> sendOTP({required String phoneNumber}) async {
    final smsCompleter = Completer<String>();

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        try {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
          SnackbarUtil.showsnackbar(
              message:
                  'Phone number automatically verified and user signed in');
        } on FirebaseAuthException catch (e) {
          SnackbarUtil.showsnackbar(
              message: e.message ?? 'Error during phone verification');
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        SnackbarUtil.showsnackbar(message: e.message ?? 'Verification failed');
        smsCompleter.completeError(e);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        smsCompleter.complete(verificationId);
        SnackbarUtil.showsnackbar(message: 'OTP sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-retrieval timeout
      },
    );

    final verificationId = await smsCompleter.future;
    return verificationId;
  }

  static Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await firebaseAuth.signInWithCredential(credential);
  }

  static Future<void> signInWithGoogle() async {
    try {
      // Attempt to sign in the user with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // If the user cancels the sign-in flow, return early
        SnackbarUtil.showsnackbar(message: 'Google sign-in cancelled');
        return;
      }

      // Obtain the authentication details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the new credential
      await FirebaseAuth.instance.signInWithCredential(credential);
      SnackbarUtil.showsnackbar(message: 'Successfully signed in with Google');
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase exceptions
      SnackbarUtil.showsnackbar(
          message: e.message ?? 'FirebaseAuthException occurred');
    } catch (e) {
      // Handle any other exceptions
      SnackbarUtil.showsnackbar(message: e.toString());
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
