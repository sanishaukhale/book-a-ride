import 'package:book_a_ride/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      Get.to(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went wrong',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  signInUser(String emailAddress, String password) async {
    try {
      final user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.showSnackbar(
        const GetSnackBar(
          title: "Success",
          message: 'Signed in successfully',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Get.to(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went wrong',
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
      Get.to(const HomeScreen());
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: 'Something went wrong',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
