import 'package:book_a_ride/login_with_email.dart';
import 'package:book_a_ride/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatelessWidget {
  const LoginWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LOGIN WITH PHONE")),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "PHONE",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "PASSWORD",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
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
                      MaterialPageRoute(builder: (context) => LoginWithEmail()),
                    );
                  },
                  child:
                  Text("Login With Email", style: TextStyle(color: Colors.red)),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child:
                  Text("SIGNUP", style: TextStyle(color: Colors.red)),
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
