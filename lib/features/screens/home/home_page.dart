import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/images_contants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likeCount = 999;

  String formatLikeCount(int likeCount) {
    if (likeCount >= 1000000) {
      return '${(likeCount / 1000000).toStringAsFixed(1)}M';
    } else if (likeCount >= 1000) {
      return '${(likeCount / 1000).toStringAsFixed(1)}K';
    } else {
      return likeCount.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(200),
                                ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: Image.asset(AllImages.profile)),
                          ),
                          Text("Your story"),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(height: 20,),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 8),
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 50,
                        // ),
                        Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(200),
                                  ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(200),
                                  child: Image.asset(AllImages.profile)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "oliviamartinez",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              width: 160,
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 15),
                              width: 20,
                              height: 34,
                              // color: Colors.amber,
                              child: Image.asset('assets/3-dots.png'),
                            )
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 50),
                              child: Text(
                                "Sen Francisco",
                                style: TextStyle(fontSize: 13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Container(
                              child: Image.asset(AllImages.post),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 30,
                              // padding: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
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
                                      child: Container(
                                          child: Icon(Icons.favorite))),
                                  // SizedBox(width: 2,),

                                  Container(
                                    child:
                                        Text("${formatLikeCount(likeCount)}"),
                                  ),
                                ],
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                    width: 60,
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
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
