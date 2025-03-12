import 'package:flutter/material.dart';

class AppbarScreen extends StatefulWidget implements PreferredSizeWidget{
  const AppbarScreen({super.key});

  @override
  State<AppbarScreen> createState() => _AppbarScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _AppbarScreenState extends State<AppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 25),
              child: Icon(Icons.arrow_back_ios),
            ),
            Container(
              padding: EdgeInsets.only(left: 120),
              child: Text("Upload", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
    );

  }
}
