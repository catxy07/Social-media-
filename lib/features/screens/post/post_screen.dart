import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/images_contants.dart';

import 'models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  int likeCount = 999;
  List<Post> _posts = [];
  bool _isLoading = true;

  String formatLikeCount(int likeCount) {
    if (likeCount >= 1000000) {
      return '${(likeCount / 1000000).toStringAsFixed(1)}M';
    } else if (likeCount >= 1000) {
      return '${(likeCount / 1000).toStringAsFixed(1)}K';
    } else {
      return likeCount.toString();
    }
  }

  Future<List<Post>> fetchMyPost() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final snapShot = await FirebaseFirestore.instance
        .collection('posts')
        .where('userId', isEqualTo: user.uid)
        .get();

    return snapShot.docs.map((doc) => Post.fromJson(doc.data())).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadUserPost();
  }

  void loadUserPost() async {
    try {
      List<Post> posts = await fetchMyPost();

      setState(() {
        _posts = posts;
        _isLoading = false;
      });
      print("user has ${posts.length} post");
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Error is: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Posts", style: TextStyle()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(left: 90, right: 70),
            //   child: Text("Your Posts", style: TextStyle(fontSize: 23, fontWeight:  FontWeight.bold),),
            // ),
            // SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: _posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = _posts[index];

                  return Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 450,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: post.imageUrl.length,
                          itemBuilder: (context, imgIndex) {
                            return Image.asset(
                              post.imageUrl[imgIndex],
                              width: 385,
                              height: 425,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 10,),

                      Container(
                        padding: EdgeInsets.only(right: 280),
                        child: Text(
                          post.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Row(
                        children: [
                          Container(
                            width: 390,
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              post.description,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                      // SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: 80,
                            height: 30,
                            // padding: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            margin: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      int a;

                                      setState(() {
                                        likeCount = likeCount + 1;
                                      });
                                    },
                                    child:
                                        Container(child: Icon(Icons.favorite))),
                                // SizedBox(width: 2,),

                                Container(
                                  child: Text("${formatLikeCount(likeCount)}"),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 3),
                            child: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 30,
                                  // padding: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(child: Icon(Icons.comment)),
                                      // SizedBox(width: 2,),
                                      Container(
                                        child: Text("1997"),
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 30,
                                  // padding: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(child: Icon(Icons.share)),
                                      // SizedBox(width: 2,),
                                      Container(
                                        child: Text("1997"),
                                      )
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  // padding: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  margin: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Container(child: Icon(Icons.save)),
                                      // SizedBox(width: 2,),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
