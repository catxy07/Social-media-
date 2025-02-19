import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _PictureState();
}

class _PictureState extends State<Picture> {

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  // Show Dialog to Choose Camera or Gallery
  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Pick from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 150, right: 100),
            child: Text(
              "Add a profile picture",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),

          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 35),
            width: 400,
            height: 100,
            child: Text("Let's add a profile picture so your friends can "
                "easily recognize you.Your picture will be visible"
                "to everyone",style: TextStyle(color: Colors.grey.shade500,fontSize: 15)),
          ),


          SizedBox(height: 50,),

          Column(
            children: [
              _selectedImage != null
                  ? Image.file(_selectedImage!, height: 250, width: 250, fit: BoxFit.cover)
                  : Icon(Icons.image, size: 100, color: Colors.grey),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showImagePickerDialog,
                child: Text("Select Image"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
