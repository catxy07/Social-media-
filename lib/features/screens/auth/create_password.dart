import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/features/screens/Auth/signup_screen.dart';
import 'package:my_social_media/features/screens/auth/picture.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/custom_colors.dart';
import '../../../core/constants/firebase.dart';
import '../dashboard/screen_navigation.dart';
import '../home/home_page.dart';
import 'login_screen.dart';

class CreatePassword extends StatefulWidget {
  final String fullname;
  final String  phone;

  const CreatePassword(
      {super.key, required this.fullname, required this.phone});

  @override
  State<CreatePassword> createState() => _CreatePassword();
}

class _CreatePassword extends State<CreatePassword> {

  //
  // Future<void> _saveData(String value, String key) async {
  //   SharedPreferences pr = await SharedPreferences.getInstance();
  //   await pr.setString(key, value);
  // }

  bool obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                    controller: password,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      // Allows only letters and spaces
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter vaild name";
                      }

                      if (value.length != 6) {
                        return "Enter proper password";
                      }
                      // if (RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      //   return "Only alphabets and spaces allow";
                      // }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 340,
                ),
                Container(
                  decoration: BoxDecoration(),
                  width: 380,
                  height: 60,
                  child: FilledButton(
                    onPressed: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(content: Text("Vaild Input!")));


                        // _saveData(widget.fullname, 'fullName');
                        // _saveData(widget.phone, 'phone');
                        // _saveData(password.text, 'password');


                        final password1 = password.text;

                        // For now, print the input
                        print('Password: $password');

                        UserCredential? user = await signUpWithEmail(password: password1, email: widget.fullname);
                        print("user is : ${user?.user?.email}");
                        if(user != null){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ScreenNavigation()));
                        }else{
                          print('failed to signup');
                        }
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => Picture()));

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
