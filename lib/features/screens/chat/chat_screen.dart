import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/chat/user_interaction_screen.dart';

import '../../../core/utils/getIteractionId.dart';
import 'model/name.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUser();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getUser() async {
    return await FirebaseFirestore.instance.collection('user').get();
  }

  void fetchUser() async {
    try {
      QuerySnapshot<Map<String, dynamic>> userDocs = await getUser();

      if (userDocs.docs.isEmpty) {
        print("No users found");
        return;
      }

      for (var doc in userDocs.docs) {
        var userData = doc.data();
        var key = doc;
        print("Name: ${key.id}");
        InteractionModel model = InteractionModel(
            name: userData['name'], lastChat: userData['email'], uid: key.id);
        userIteraction.add(model);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {});
      });
      print(userIteraction.length);
    } catch (e) {
      print("Error: $e");
    }
  }

  List<InteractionModel> userIteraction = [];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Chatting",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
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
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: SingleChildScrollView(
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

              Container(
                // color: Colors.deepOrange,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userIteraction.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () async {
                        final FirebaseAuth auth = FirebaseAuth.instance;
                         final user =  auth.currentUser;
                        final uid = user?.uid;
                        // print(await compareUserIds(uid!,userIteraction[index].uid));
                       String iteractionId= await compareUserIds(userIteraction[index].uid,uid!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserInteractionScreen(IteractionId: iteractionId, userId: uid, IteractedUserId: userIteraction[index].uid, iteractedUsername: userIteraction[index].name,)));
                      },
                      child: Container(
                        color: Colors.white70,
                        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(),
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
                                      child: Text(
                                        userIteraction[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 190,
                                    ),
                                    Container(
                                      child: Text(
                                        "11:43",
                                        style:
                                            TextStyle(color: CustomColors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 170, top: 10),
                                      child: Text(
                                        userIteraction[index].lastChat,
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
