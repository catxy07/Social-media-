import 'package:flutter/material.dart';
import 'package:my_social_media/splash_screen.dart';

import 'core/constants/theme.dart';
import 'features/screens/Auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomLightTheme,
      home: SplashScreen(),
    );
  }
}



