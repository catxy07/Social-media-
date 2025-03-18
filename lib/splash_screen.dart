import 'package:flutter/material.dart';
import 'package:my_social_media/features/screens/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/screens/auth/login_screen.dart';
import 'features/screens/dashboard/screen_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    islogin();
  }

  void islogin() async{

    await Future.delayed(Duration(seconds: 2));
    SharedPreferences sp = await SharedPreferences.getInstance();

    final String? isValue = sp.getString('fullname');

    if(isValue != null){
     Navigator.push(context, MaterialPageRoute(builder: (context)=> ScreenNavigation()));

    } else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
    }
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Center(

      child: Text("Temp"),
    ),
    );
  }
}
