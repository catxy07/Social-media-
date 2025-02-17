import 'package:flutter/material.dart';
import 'package:my_social_media/features/screens/Auth/signup_screen.dart';

import '../../../core/constants/custom_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController login = TextEditingController();
  TextEditingController signUp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 210),
                child: Text(
                  "Justin",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        width: 380,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "User, email",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(),
                          controller: login,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.grey)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 10),
                        width: 380,
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Password",
                            border: InputBorder.none,
                          ),
                          style: TextStyle(),
                          controller: signUp,
                        ),
                        decoration: BoxDecoration(
                          // color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.grey)
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 230, top: 20),
                    child: Text(
                      "Forgot password?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 190,
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    width: 380,
                    height: 65,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text(
                        "Log in",
                        style: TextStyle(fontSize: 19),
                      ),
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: CustomColors.orange800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 65,
                      ),
                      Container(
                        child: Text("Don't have account? ",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Container(
                            child: Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: CustomColors.orange700))),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
