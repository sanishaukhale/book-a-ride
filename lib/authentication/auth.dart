import 'package:book_a_ride/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInUser(String emailAddress, String password) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailAddress, password: password);
      if (user != null) {
       Get.to(HomeScreen());
      }
      return false;
    } catch (e) {
      print(e);
    }
  }
}

