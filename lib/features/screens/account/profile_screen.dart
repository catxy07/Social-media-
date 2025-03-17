import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        Container(
          padding: EdgeInsets.only(left: 150, top: 100, right: 140),
          child:  ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset('assets/profile.jpg', width: 100, height: 100,)),
        ),
          
          Container(
            padding: EdgeInsets.only(left: 150, top: 20, right: 140),
            child: Text("Shin Ryu-jin", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          ),

          Container(
            margin: EdgeInsets.only(top: 20,left: 20),
            child: Text("ITYZ k-pop idol Group Member", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          ),
          SizedBox(height: 40,),
          Row(
            children: [
              Column(
                children: [

                  Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("120", style: TextStyle(fontWeight:  FontWeight.bold, fontSize: 18),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50),
                    child: Text("Posts", style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(width: 50,),

                ],
              ),
              SizedBox(width: 40),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Text("120", style: TextStyle(fontWeight:  FontWeight.bold, fontSize: 18),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Text("Posts", style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(width: 50,),
                ],
              ),
              SizedBox(width: 45),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Text("120", style: TextStyle(fontWeight:  FontWeight.bold, fontSize: 18),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40),
                    child: Text("Posts", style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(width: 50,),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 170,
                height: 50,
                // padding: EdgeInsets.only(left: 50, top: 30),
                child: FilledButton(onPressed: (){}, child: Text("Following" ,style: TextStyle(color: Colors.black, fontSize: 20),)
                , style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(CustomColors.grey60),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                ),
              ),
              Container(
                width: 170,
                height: 50,
                // padding: EdgeInsets.only(left: 50, top: 30),
                child: FilledButton(onPressed: (){}, child: Text("Message", style: TextStyle(color: Colors.black, fontSize: 20),)
                  , style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(CustomColors.grey60),
                    shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        )
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
