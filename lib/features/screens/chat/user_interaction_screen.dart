import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/chat/user_chat_ab_screen.dart';

class UserInteractionScreen extends StatefulWidget {
  const UserInteractionScreen({super.key});

  @override
  State<UserInteractionScreen> createState() => _UserInteractionScreenState();
}

class _UserInteractionScreenState extends State<UserInteractionScreen> {

  late double ScreenHeight;
  late double ScreenWidth;
  @override
  Widget build(BuildContext context) {


    ScreenHeight = MediaQuery.of(context).size.height;
    ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: UserChatAbScreen(),
      body: SingleChildScrollView(
        child: Container(
          height: ScreenHeight - kToolbarHeight - 60,

          child: Column(
            children: [
             Expanded(
               child: Container(
                 color: Colors.amber,
                 child: Text("gfcdgfx"),
                 // height: 600,
               ),
             ),
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                      height: 60,
                      decoration: BoxDecoration(
                        color: CustomColors.grey80,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Chat here",
                        ),

                      ),
                    ),

                    SizedBox(width: 10,),

                    Container(
                      child: Icon(Icons.send),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
