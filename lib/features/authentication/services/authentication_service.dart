import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laundry_bin/core/utils/snackbar.dart';

class EmailSignupService {
  static final firebaseAuth = FirebaseAuth.instance;

  /// Sign up a user with the provided email and password.
  ///
  /// This function creates a new user in the Firebase Authentication service
  /// with the given email and password. If the user is successfully created,
  /// an email verification is sent to the user's email address and the user's
  /// display name is updated to the provided email. A snackbar is displayed
  /// with the message "Email verification sent".
  ///
  /// Parameters:
  /// - email: The email of the user to be created.
  /// - password: The password of the user to be created.
  ///
  /// Returns:
  /// A Future that completes when the user is successfully created.
  static Future<void> signUp(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.currentUser!.sendEmailVerification();
      await firebaseAuth.currentUser!.updateDisplayName(email);
      SnackbarUtil.showsnackbar(message: "Email verification sent");
    }
  }

  /// Signs in a user with the provided email and password.
  ///
  /// Parameters:
  /// - `email`: The email of the user. It is a required parameter.
  /// - `password`: The password of the user. It is a required parameter.
  ///
  /// Returns:
  /// - A `Future` that completes with `void` when the sign-in is successful.
  ///
  /// Throws:
  /// - `FirebaseAuthException` if the sign-in fails.
  static Future<void> signIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  /// Sends an OTP (One-Time Password) to the provided phone number and returns the verification ID.
  ///
  /// Parameters:
  /// - `phoneNumber`: The phone number to send the OTP to. It is a required parameter.
  ///
  /// Returns:
  /// - A `Future` that completes with the verification ID when the OTP is sent successfully.
  ///
  /// Throws:
  /// - A `FirebaseAuthException` if the verification fails.
  ///
  /// This method uses the Firebase Authentication service to send an OTP to the provided phone number.
  /// It uses the `verifyPhoneNumber` method to initiate the verification process.
  /// If the verification is completed successfully, it signs in the user with the provided `phoneAuthCredential`
  /// and shows a success message. If the verification fails, it completes the `smsCompleter` with the error.
  /// If the OTP is sent successfully, it completes the `smsCompleter` with the verification ID and shows a message.
  /// If the auto-retrieval timeout occurs, it completes the `smsCompleter` with the verification ID and shows a message.
  ///
  /// The method returns the verification ID when the OTP is sent successfully.
  static Future<String> sendOTP({required String phoneNumber}) async {
    final smsCompleter = Completer<String>();
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        await firebaseAuth.signInWithCredential(phoneAuthCredential);
        SnackbarUtil.showsnackbar(
            message: 'Phone number automatically verified and user signed in');
      },
      verificationFailed: (FirebaseAuthException e) {
        if (!smsCompleter.isCompleted) {
          smsCompleter.completeError(e);
        }
        SnackbarUtil.showsnackbar(message: e.code);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        if (!smsCompleter.isCompleted) {
          smsCompleter.complete(verificationId);
        }
        SnackbarUtil.showsnackbar(message: 'OTP sent to $phoneNumber');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (!smsCompleter.isCompleted) {
          smsCompleter.complete(verificationId);
        }
        // SnackbarUtil.showsnackbar(message: 'Auto-retrieval timeout');
      },
    );

    final verificationId = await smsCompleter.future;
    return verificationId;
  }

  /// Verifies the OTP (One-Time Password) using the provided verification ID and OTP.
  ///
  /// Parameters:
  /// - `verificationId`: The verification ID received from the phone number verification process.
  /// - `otp`: The OTP (One-Time Password) entered by the user.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the OTP verification is completed.
  ///
  /// This method creates a `PhoneAuthCredential` using the `verificationId` and `otp`,
  /// and then signs in the user using the `firebaseAuth.signInWithCredential` method.
  static Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await firebaseAuth.signInWithCredential(credential);
  }

  /// Sign in the user with Google.
  ///
  /// This function attempts to sign in the user with Google using the Google Sign-In API.
  /// If the user cancels the sign-in flow, a snackbar is shown with the message 'Google sign-in cancelled'.
  /// If the sign-in is successful, a snackbar is shown with the message 'Successfully signed in with Google'.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the sign-in process is finished.
  static Future<void> signInWithGoogle() async {
    // Attempt to sign in the user with Google
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // If the user cancels the sign-in flow, return early
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
    await firebaseAuth.signInWithCredential(credential);
    SnackbarUtil.showsnackbar(message: 'Successfully signed in with Google');
  }

  /// Signs out the user from Firebase and Google Sign-In if necessary.
  ///
  /// This function first signs out the user from Firebase using `firebaseAuth.signOut()`.
  /// Then, it checks if the user is signed in with Google using `googleSignIn.isSignedIn()`.
  /// If the user is signed in with Google, it signs them out using `googleSignIn.signOut()`.
  ///
  /// Returns:
  /// - `Future<void>`: A future that completes when the sign-out process is finished.
  static Future<void> signOut() async {
    // Sign out from Firebase
    await firebaseAuth.signOut();

    // Check if the user is signed in with Google and sign out if necessary
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.signOut();
    }
  }
  static Future<void> resetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
