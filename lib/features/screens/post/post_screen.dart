import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/images_contants.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

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
      appBar: AppBar(title: Text("Your Posts",style: TextStyle()),),
     body: SingleChildScrollView(
       child: Column(

         children: [
           // Container(
           //   padding: EdgeInsets.only(left: 90, right: 70),
           //   child: Text("Your Posts", style: TextStyle(fontSize: 23, fontWeight:  FontWeight.bold),),
           // ),
           // SizedBox(height: 10,),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             child: ListView.builder(
               scrollDirection: Axis.vertical,
               physics: ScrollPhysics(),
               shrinkWrap: true,
               itemCount: 10,
               itemBuilder: (BuildContext context, int index) {
               return Container(
                 child: Column(
                     children: [
                   Image.asset(AllImages.post, width: 385, height: 450,),

                       // SizedBox(height: 10,),
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
               )
                 );
             },),
           )
         ],
       ),
     ),
    );
  }
}
