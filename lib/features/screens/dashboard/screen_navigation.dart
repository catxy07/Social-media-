import 'package:flutter/material.dart';
import 'package:my_social_media/features/screens/account/profile_screen.dart';
import 'package:my_social_media/features/screens/chat/chat_screen.dart';
import 'package:my_social_media/features/screens/home/home_page.dart';
import 'package:my_social_media/features/screens/post/post_screen.dart';
import 'package:my_social_media/features/screens/post/upload_screen.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {

  int currentIndex=0;

  List<Widget> list1 = [
    HomePage(),
    ChatScreen(),
    UploadScreen(),
    PostScreen(),
    ProfileScreen(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:    NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: ""),
        NavigationDestination(icon: Icon(Icons.message), label: ""),
        NavigationDestination(icon: Icon(Icons.add), label: ""),
        NavigationDestination(icon: Icon(Icons.post_add), label: ""),
        NavigationDestination(icon: Icon(Icons.person), label: ""),
      ],
      selectedIndex: currentIndex,
        onDestinationSelected: (int index){

        print("index is: $index");
        currentIndex = index;
        setState(() {

        });
        },
      ),
      body: list1[currentIndex]
    );
  }
}
