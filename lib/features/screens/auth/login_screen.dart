import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/features/screens/Auth/signup_screen.dart';
import 'package:my_social_media/features/screens/home/home_page.dart';

import '../../../core/constants/custom_colors.dart';
import '../../../core/constants/firebase.dart';
import '../../../splash_screen.dart';
import '../dashboard/screen_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
       width: screenWidth,
      height: screenHeight,
      child: Scaffold(
        body: Stack(
          children: [
            Transform.translate(
              offset: const Offset(-210,0),
              child: Container(
                margin: EdgeInsets.only(top: 20),
                width: 350,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  gradient: RadialGradient(
                    colors: [
                      Colors.deepOrange.withOpacity(0.12),
                      CustomColors.orange100.withOpacity(0.40),
                      CustomColors.orange100.withOpacity(0.35),
                      CustomColors.orange100.withOpacity(0.30),
                      CustomColors.orange100.withOpacity(0.25),
                      CustomColors.orange100.withOpacity(0.20),
                      CustomColors.orange100.withOpacity(0.15),
                      CustomColors.orange100.withOpacity(0.10),
                      CustomColors.orange100.withOpacity(0.08),
                      CustomColors.orange100.withOpacity(0.07),

                      // CustomColors.orange100.withOpacity(0.09),
                      // CustomColors.orange200.withOpacity(0.2),
                      // CustomColors.orange300.withOpacity(0.2),
                      // CustomColors.orange400,
                      // CustomColors.orange500,
                      // CustomColors.orange600,
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 210),
                      child: Text(
                        "Justin",
                        style:
                            TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
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
                                controller: email,
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
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
                                controller: password,
                              ),
                              decoration: BoxDecoration(
                                  // color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(width: 1, color: Colors.grey)),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 230, top: 20),
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 185,
                        ),
                        Container(
                          decoration: BoxDecoration(),
                          width: 380,
                          height: 65,
                          child: FilledButton(
                            onPressed: () async{
                              UserCredential? user = await loginWithEmail(email: email.text, password: password.text);

                              if(user != null){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenNavigation()));
                              }else{
                                print('failed to LOGIN');
                              }

                            },
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
          ],
        ),
      ),
    );
  }
}
