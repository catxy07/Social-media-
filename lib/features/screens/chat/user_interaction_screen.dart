import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/chat/model/chat_model.dart';
import 'package:my_social_media/features/screens/chat/user_chat_ab_screen.dart';

class UserInteractionScreen extends StatefulWidget {
  String IteractionId;
  String userId;
  String IteractedUserId;

  UserInteractionScreen({super.key,
  required this.IteractionId,
    required this.userId,
    required this.IteractedUserId,
  });

  @override
  State<UserInteractionScreen> createState() => _UserInteractionScreenState();
}

class _UserInteractionScreenState extends State<UserInteractionScreen> {
  TextEditingController chat = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("chat");
  final List<Chat> msg = [
    // ChatModel(
    //   isCurrentUser: true,
    //   msg: 'Hey! How have you been? It’s been such a long time since we last talked. I was just thinking about the good old days when we used to hang out all the time. Hope everything is going well for you!',
    //   time: '12:44 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: false,
    //   msg: 'Hey! I know, right? It feels like forever since we caught up. Things have been pretty hectic on my end, but overall, I can’t complain. Let’s plan to meet up soon!',
    //   time: '12:45 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: true,
    //   msg: 'That sounds like a great idea! Maybe this weekend? We could grab some coffee and just chill for a bit.',
    //   time: '12:46 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: false,
    //   msg: 'This weekend sounds perfect! I’ve been craving some good coffee. Do you still go to that café we used to love?',
    //   time: '12:47 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: true,
    //   msg: 'Absolutely! They still have the best lattes. Plus, I heard they added some new desserts to their menu!',
    //   time: '12:48 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: false,
    //   msg: 'Oh wow, that’s awesome! I can’t wait to try them out. It’s been so long since I had a proper catch-up session with you.',
    //   time: '12:49 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: true,
    //   msg: 'Same here! So much has happened, I have so many stories to tell you. Life has been a rollercoaster lately!',
    //   time: '12:50 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: false,
    //   msg: 'I totally get that! Work has been crazy on my end, but I’ve managed to squeeze in some fun adventures too. Can’t wait to share them!',
    //   time: '12:51 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: true,
    //   msg: 'That’s great to hear! We definitely need to make these catch-ups more frequent. Let’s not go this long without talking again!',
    //   time: '12:52 PM',
    // ),
    // ChatModel(
    //   isCurrentUser: false,
    //   msg: 'Agreed! Alright, I’ll see you this weekend then. It’s going to be great catching up in person!',
    //   time: '12:53 PM',
    // ),
  ];
  bool crChat = true;

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }

  Future<void> sendMessage() async {
    String message = chat.text.trim();
    if (message.isEmpty) {
      print("Message is empty");
      return;
    }

    try {
      final databaseRef = FirebaseDatabase.instance.ref("chat"); // Ensure correct path
      String messageId = databaseRef.push().key!; // Unique ID

      print("Sending message.");
      print("Sender ID: ${widget.userId}");
      print("Receiver ID: ${widget.IteractedUserId}");

      await databaseRef.child(widget.IteractionId).child(messageId).set({
        'senderId': widget.userId,
        'receiverId': widget.IteractedUserId,
        'chatMsg': message,
        'chatTime': DateTime.now().millisecondsSinceEpoch,
      });

      chat.clear(); // Clear text field
      print("Message sent!");
    } catch (e) {
      print("Failed to send message: $e");
    }
  }

  // void _sendmsg() {
  //   setState(() {
  //     msg.add(Chat(
  //         isCurrentUser: crChat, msg: chat.text, time: _getCurrentTime()));
  //     chat.clear();
  //     crChat = !crChat;
  //   });
  // }

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
                  child: ListView.builder(
                    itemCount: msg.length,
                    itemBuilder: (BuildContext context, int index) {
                      Chat chat = msg[index];
                      return Align(
                        // alignment: chat.isCurrentUser
                        //     ? Alignment.centerRight
                        //     : Alignment.centerLeft,
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 50,
                            maxWidth: ScreenWidth * 0.7, // Set a max width
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          // margin: EdgeInsets.only(
                          //     top: 10,
                          //     // left: chat.isCurrentUser ? 100 : 10,
                          //     // right: chat.isCurrentUser ? 10 : 100),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(20),
                          //   color: chat.isCurrentUser
                          //       ? CustomColors.grey
                          //       : CustomColors.grey80,
                          // ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            // Align time to the right
                            children: [
                              // Text(
                              //   chat.msg,
                              //   style: TextStyle(
                              //       fontSize: 18, color: Colors.white),
                              // ),
                              SizedBox(height: 5),
                              // Spacing between message and time
                              // Text(
                              //   // chat.time,
                              //   style: TextStyle(
                              //       fontSize: 12,
                              //       color: Colors
                              //           .white70), // Smaller, lighter text
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 7),
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
                          controller: chat,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child:
                            InkWell(onTap: sendMessage, child: Icon(Icons.send)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
