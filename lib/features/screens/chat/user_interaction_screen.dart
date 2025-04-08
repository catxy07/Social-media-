import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/chat/model/chat_model.dart';
import 'package:my_social_media/features/screens/chat/user_chat_ab_screen.dart';

class UserInteractionScreen extends StatefulWidget {
  String IteractionId;
  String userId;
  String iteractedUsername;
  String IteractedUserId;

  UserInteractionScreen({
    super.key,
    required this.IteractionId,
    required this.userId,
    required this.iteractedUsername,
    required this.IteractedUserId,
  });

  @override
  State<UserInteractionScreen> createState() => _UserInteractionScreenState();
}

class _UserInteractionScreenState extends State<UserInteractionScreen> {
  TextEditingController chat = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("chat");

  late DatabaseReference _iteractionreference;

  late Stream<DatabaseEvent> _stream;
  final List<Chat> msg = [];
  bool crChat = true;

  String _getCurrentTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iteractionreference = databaseRef.child(widget.IteractionId);
    _stream = _iteractionreference.onValue;
  }

  Future<void> sendMessage() async {
    String message = chat.text.trim();
    if (message.isEmpty) {
      print("Message is empty");
      return;
    }

    try {
      final databaseRef = FirebaseDatabase.instance.ref("chat");
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

      chat.clear(); // Clear text fieldc
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
        appBar: UserChatAbScreen(iteractedUserName: widget.iteractedUsername,),
        body: SingleChildScrollView(
          child: Container(
            height: ScreenHeight - kToolbarHeight - 60,
            width: ScreenWidth,
            child: Column(
              children: [
                StreamBuilder(
                  stream: _stream,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    }

                    if (snapshot.hasData &&
                        snapshot.data!.snapshot.value != null) {
                      Map<dynamic, dynamic> data =
                          snapshot.data!.snapshot.value as Map;
                      // msg.clear();
                      data.forEach((key, value) {
                        print('value is ${value.runtimeType}');
                        if(!msg.any((value)=>value.id==key)){

                          msg.add(Chat(
                              id: key,
                              senderId: value['senderId'],
                              receiverId: value['receiverId'],
                              chatMsg: value['chatMsg'],
                              chatTime: DateTime.now()));
                        }
                      });
                      // List<String> messages = data.values.cast<String>().toList();

                      print('data is here ${data}');
                      return Expanded(
                        child: ListView.builder(
                          itemCount: msg.length,
                          itemBuilder: (BuildContext context, int index) {
                            Chat chat = msg[index];
                            print('data is here ${chat.chatMsg}');
                            // return Container(
                            //   height: 100,
                            //   width: 100,
                            //   color: Colors.green,margin: EdgeInsets.only(bottom: 20),);

                            return Align(
                              alignment: chat.senderId == widget.userId
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                  minWidth: 50,
                                  maxWidth:
                                      ScreenWidth * 0.7, // Set a max width
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: EdgeInsets.only(
                                    top: 10,
                                    left: chat.senderId == widget.userId ? 100 : 10,
                                    right: chat.senderId == widget.userId ? 10 : 100),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: chat.senderId == widget.userId
                                      ? CustomColors.grey
                                      : CustomColors.grey80,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  // Align time to the right
                                  children: [
                                    Text(
                                      chat.chatMsg,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    // Spacing between message and time
                                    Text(
                                      chat.chatTime.toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors
                                              .white70), // Smaller, lighter text
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(child: Text("No data available"));
                    }
                  },
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
                        child: InkWell(
                            onTap: sendMessage, child: Icon(Icons.send)),
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
