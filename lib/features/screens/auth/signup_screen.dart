import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/custom_colors.dart';
import 'create_password.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Material(
          child: Form(
            key: _formKey,
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
                  width: 800,
                  padding: EdgeInsets.only(top: 35, left: 20),
                  child: Text(
                    "What's your name and password?",
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
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                    ),
                    controller: fullName,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^[a-zA-Z\s]+$')),
                      // Allows only letters and spaces
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter vaild name";
                      }

                      if (value.length < 6) {
                        return "Enter proper name";
                      }
                      // if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      //   return "Only alphabets and spaces allow";
                      // }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(right: 275),
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(

                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: phone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade700),
                      ),
                    ),
                    validator: (e) {
                      if (e == null || e.isEmpty) {
                        return "Please Enter a number";
                      }
                      if (e.length != 10) {
                        return "Enter valid number";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 280,
                ),
                Container(
                  decoration: BoxDecoration(),
                  width: 380,
                  height: 60,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Vaild Input!")));
                          //
                          // _saveData(fullName.text, 'fullName');
                          // _saveData(phone.text, 'phone');


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreatePassword()));
                      // fullname: fullName.text, phone: phone.text,
                      }
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
      ),
    );
  }
}
