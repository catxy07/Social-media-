import 'package:flutter/material.dart';


import '../../../core/constants/custom_colors.dart';
import 'login_screen.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePassword();
}

class _CreatePassword extends State<CreatePassword> {
  bool obscureText = true;

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
                padding: EdgeInsets.only(top: 35, right: 150),
                child: Text(
                  "Create password",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                width: 380,
                child: Text(
                  "Create a password comprising a minimum of 6"
                  " letters or digits.Ensure It's something that"
                  " would be challenging for others ro predict",
                  style: TextStyle(
                      color: CustomColors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
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
                        "Password",
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
                    ),
                    child: TextField(
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        // Password icon at the start
                        suffixIcon: IconButton(
                          icon:  Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ), onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                        },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 340,
              ),
              Container(
                decoration: BoxDecoration(),
                width: 380,
                height: 60,
                child: FilledButton(
                  onPressed: () {},
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
