import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/login_with_email/login_with_email.dart';
import '../authentication/auth.dart';
import '../login_with_phone/login_with_phone.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

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
                'assets/images/signup.png',
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              const Text(
                "SIGNUP",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (!regex.hasMatch(value!)) {
                      return """* Minimum 1 Upper case\n* Minimum 1 lowercase\n* Minimum 1 Numeric Number\n* Minimum 1 Special Character\n* Common Allow Character ( ! @ # \$ & * ~ )""";
                    } else {
                      return null;
                    }
                  },
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
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
                width: MediaQuery.of(context).size.width * 0.88,
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (password.text != confirmPassword.text) {
                      return "Passwords doesn't match";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.grey),
                  controller: confirmPassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.fingerprint_outlined,
                      size: 28,
                    ),
                    hintText: 'Confirm Password',
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
                    if (email.text.isNotEmpty ||
                        password.text.isNotEmpty ||
                        confirmPassword.text.isNotEmpty) {
                      Auth a = Auth();
                      a.createUser(email.text, password.text);
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
                    'SIGNUP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login with Email? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(
                        LoginWithEmail(),
                      );
                    },
                    child: const Text(
                      "Click Here",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login with Phone? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(
                        const LoginWithPhone(),
                      );
                    },
                    child: const Text(
                      "Click Here",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
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
