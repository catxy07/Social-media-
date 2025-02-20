import 'package:flutter/material.dart';

class ScreenNavigation extends StatefulWidget {
  const ScreenNavigation({super.key});

  @override
  State<ScreenNavigation> createState() => _ScreenNavigationState();
}

class _ScreenNavigationState extends State<ScreenNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar:    NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: ""),
        NavigationDestination(icon: Icon(Icons.message), label: ""),
        NavigationDestination(icon: Icon(Icons.add), label: ""),
        NavigationDestination(icon: Icon(Icons.post_add), label: ""),
        NavigationDestination(icon: Icon(Icons.person), label: ""),
      ]),
      body: [][currentIndex]
    );
  }
}
