import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/features/screens/post/appBar_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? _imageFile;

  final ImagePicker picker = ImagePicker();

  void _pickImage(ImageSource source) async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreen(),
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(
            color: Colors.white, // White background box
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Title',
                    filled: true,
                    fillColor: Colors.white,
                    // Ensure text field has white background
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero, // Rectangle shape
                      borderSide:
                          BorderSide(width: 1, color: CustomColors.grey60),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero, // Rectangle shape
                      borderSide:
                          BorderSide(width: 1, color: CustomColors.grey60),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            color: Colors.white, // White background box
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    filled: true,
                    fillColor: Colors.white,
                    // Ensure text field has white background
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero, // Rectangle shape
                      borderSide:
                          BorderSide(width: 1, color: CustomColors.grey60),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero, // Rectangle shape
                      borderSide:
                          BorderSide(width: 1, color: CustomColors.grey60),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // width: 380,
            // height: 250,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 270),
                  child: Container(
                    // margin: EdgeInsets.only(right: 241, ),
                    child: Text(
                      "Upload Here",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: _pickImage(ImageSource.images),
                  child: Container(
                    child: Image.asset(
                      'assets/drag.jpg',
                      width: 370,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
