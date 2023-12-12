import 'package:book_a_ride/home/home.dart';
import 'package:book_a_ride/login_with_phone/login_with_phone.dart';
import 'package:book_a_ride/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../authentication/auth.dart';

class LoginWithEmail extends StatelessWidget {
  LoginWithEmail({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LOGIN WITH EMAIL")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "EMAIL",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(
              controller: email,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "PASSWORD",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(
              controller: password,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Auth a = Auth();
                 a.signInUser(email.text, password.text);
                  // if (x) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()),
                  //   );
                  // } else {
                  //   print("ERROR");
                  // }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginWithPhone()),
                    );
                  },
                  child: Text("Login With Phone",
                      style: TextStyle(color: Colors.red)),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text("SIGNUP", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/google.png",
                      height: 80,
                      width: 80,
                    )),
                Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    child: Image.asset(
                      "assets/images/facebook.png",
                      height: 80,
                      width: 80,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
