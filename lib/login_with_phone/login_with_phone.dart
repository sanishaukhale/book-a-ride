import 'package:book_a_ride/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/login_with_phone/verify.dart';
import '../authentication/auth.dart';
import '../login_with_email/login_with_email.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController countryController = TextEditingController();

  var phone = "";

  @override
  void initState() {
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/login.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const Text(
                "Login with Phone",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: MediaQuery.of(context).size.height * 0.001,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(
                        fontSize: 33,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          phone = value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    )
                  ],
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
                    if (phone.isNotEmpty) {
                      Auth a = Auth();
                      a.sendOTP(countryController.text + phone);
                      Get.to(const MyVerify());
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: "Error",
                          message: 'Phone number cannot be empty',
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
                    'SEND OTP',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an Account?"),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(Signup());
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
                  const Text("Continue with Email? "),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Get.to(LoginWithEmail());
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
