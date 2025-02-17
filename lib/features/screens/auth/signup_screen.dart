import 'package:flutter/material.dart';



import '../../../core/constants/custom_colors.dart';
import 'create_password.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                padding: EdgeInsets.only(right: 340),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios)),
              ),
              Container(
                padding: EdgeInsets.only(top: 35, right: 130),
                child: Text(
                  "What's your name?",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 120),
                child: Text(
                  "Add your name so friends can find you",
                  style: TextStyle(color: CustomColors.grey),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(right: 310),
                      child: Text(
                        "Full name",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 380,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade800, width: 1)
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          // labelText: "Full name",
                          border: InputBorder.none),
                    ),
                  ),
        
        
                ],
              ),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.only(right: 310),
                  child: Text(
                    "Full name",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  )),

              SizedBox(height: 10,),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    width: 380,
                    height: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        // labelText: "Full name",
                          border: InputBorder.none),
                    ),
                  ),


                ],
              ),
              SizedBox(height: 350,),
              Container(
                decoration: BoxDecoration(),
                width: 380,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CreatePassword()));
                  },
                  child: Text(
                    "Next",
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
                    width: 80,
                  ),
                  Container(
                    child: Text("Already have account?",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Container(
                        child: Text(" Login in",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.orange700))),
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
