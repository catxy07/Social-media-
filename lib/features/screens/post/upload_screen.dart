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
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = []; // Store multiple images

  // Function to pick an image
  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _selectedImages.add(File(image.path)); // Add to list
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
      appBar: AppbarScreen(),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue,
          child: Column(
            children: [
              SizedBox(height: 15),
              _buildTextFieldContainer("Title", "Enter title"),
              SizedBox(height: 25),
              _buildTextFieldContainer("Description", "Enter description"),
              SizedBox(height: 20),

              // Dynamically generated upload containers
              Column(
                children: _selectedImages
                    .asMap()
                    .entries
                    .map((entry) =>
                        _buildUploadContainer(entry.key, entry.value))
                    .toList(),
              ),

              SizedBox(height: 10),

              // Button to add more upload containers
              Container(
                padding: EdgeInsets.only(left: 250),
                child: FilledButton(
                  onPressed: _showImagePickerDialog,
                  child: Text("Add pics"),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 200,
                height: 50,
                child: FilledButton(
                  onPressed: () {},
                  child: Text("Post"),
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue)),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Text Field Container
  Widget _buildTextFieldContainer(String title, String hint) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(width: 1, color: CustomColors.grey60),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(width: 1, color: CustomColors.grey60),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Upload Image Container (Dynamically created)
  Widget _buildUploadContainer(int index, File imageFile) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 270),
            child: Text("Upload Here",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          SizedBox(height: 10),

          // Show selected image
          InkWell(
            onTap: _showImagePickerDialog,
            child: Image.file(imageFile,
                width: 370, height: 200, fit: BoxFit.cover),
          ),

          SizedBox(height: 10),

          // Remove Image Button
          Container(
            padding: EdgeInsets.only(left: 250),
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _selectedImages.removeAt(index);
                });
              },
              child: Text("Remove"),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
