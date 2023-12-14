import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/home/home.dart';

class Auth {
  createUser(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: 'Account created',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      Get.offAll(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  signInUser(String emailAddress, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: 'Signed in successfully',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      Get.offAll(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went wrong, please try again',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  static String verify = "";
  sendOTP(String phone) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Auth.verify = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOtp(String code) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential =
          PhoneAuthProvider.credential(verificationId: verify, smsCode: code);
      await auth.signInWithCredential(credential);
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: 'OTP verified successfully',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('loggedIn', true);
      Get.offAll(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Enter the correct OTP',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  signinWithGoogle() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        UserCredential result = await auth.signInWithCredential(authCredential);

        if (result != null) {
          Get.showSnackbar(
            const GetSnackBar(
              title: "Success",
              message: 'Signed in successfully',
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('loggedIn', true);
          Get.offAll(const HomeScreen());
        }
      }
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Try signin again',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
