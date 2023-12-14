import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/login_with_phone/login_with_phone.dart';
import '/signup/signup.dart';
import '../authentication/auth.dart';

class LoginWithEmail extends StatelessWidget {
  LoginWithEmail({super.key});

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                "Login with Email",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)) {
                      return null;
                    } else {
                      return 'Enter a valid email';
                    }
                  },
                  style: const TextStyle(color: Colors.grey),
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outlined,
                      size: 28,
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (password.text == null) {
                      return "Password cannot be null";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.grey),
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.fingerprint_outlined,
                      size: 28,
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (email.text.isNotEmpty || password.text.isNotEmpty) {
                      Auth auth = Auth();
                      auth.signInUser(email.text, password.text);
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Error",
                          message: 'Fields cannot be Empty',
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3.0,
                  ),
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Auth auth = Auth();
                    auth.signinWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 3.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(
                        Signup(),
                      );
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Continue with Phone? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(const LoginWithPhone());
                    },
                    child: const Text(
                      "Click Here",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
