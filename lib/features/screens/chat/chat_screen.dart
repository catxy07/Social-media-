import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/chat/user_interaction_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Chatting",
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            // Container(
            //   // color: Colors.amberAccent,
            //   child: Row(
            //     children: [
            //       Container(
            //         padding: EdgeInsets.only(top: 40,left: 17),
            //         child: Text("Chatting", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            //       ),
            //       Container(
            //
            //         padding: EdgeInsets.only(top: 45,left: 230),
            //         child: Icon(Icons.search, size: 30,),
            //       ),
            //     ],
            //   ),
            // ),



            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserInteractionScreen()));
              },
              child: Container(
                // color: Colors.deepOrange,
                child: ListView.builder(

                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,

                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.white70,
                  margin: EdgeInsets.only(left: 15, right:  15, bottom: 15),
                  child: Row(

                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(

                  ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset('assets/circle.jpg')),
                      ),

                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("Sophia Williams" ,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                              ),

                              SizedBox(width: 100,),
                              Container(
                                child: Text("11:43", style: TextStyle(color: CustomColors.grey),),
                              ),
                            ],

                          ),

                          Row(

                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 50, top: 10),
                                child: Text("Hey! Are we still on for coffee this Saturday?", style: TextStyle(fontSize: 10),),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
                },


                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
