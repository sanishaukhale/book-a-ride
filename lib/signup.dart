import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGNUP"),
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
            const Text(
              "PASSWORD",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(
              controller: password,
            ),
            const Text(
              "CONFIRM PASSWORD",
              style: TextStyle(fontSize: 15),
            ),
            TextFormField(),
            SizedBox(height: 10,),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "SIGNUP",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
