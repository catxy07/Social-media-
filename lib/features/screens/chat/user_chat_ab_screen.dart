//
// import 'package:flutter/material.dart';
//
// class UserChatAbScreen extends StatelessWidget with PreferredSizeWidget{
//   const UserChatAbScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.only(top: 45, left: 15),
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.asset('assets/post.jpg', width: 70, height: 70,)),
//                 ),
//
//                 SizedBox(width: 10,),
//
//                 Text("Xavier Peloski", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
//               ],
//             )
//           ],
//         )
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => Size(double.infinity,100);
// }





import 'package:flutter/material.dart';

class UserChatAbScreen extends StatefulWidget implements PreferredSizeWidget{

  String iteractedUserName;

  UserChatAbScreen({super.key,
  required this.iteractedUserName
  });

  @override
  State<UserChatAbScreen> createState() => _UserChatAbScreenState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _UserChatAbScreenState extends State<UserChatAbScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
      return  Container(
        width: screenWidth,
        height: screenHeight,
        child: SafeArea(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 15,),
                ClipRRect(

                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset('assets/post.jpg', width: 60, height: 60,)),

                SizedBox(width: 10,),

                Text(widget.iteractedUserName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              ],
            ),
        ),
      );

  }
}












