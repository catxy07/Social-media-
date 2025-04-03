import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_social_media/core/constants/custom_colors.dart';
import 'package:my_social_media/core/constants/images_contants.dart';
import 'package:my_social_media/features/screens/post/appBar_screen.dart';
import 'package:my_social_media/features/screens/post/upload_model.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> _selectedImages = []; // Store multiple images

  final TextEditingController postTitle = TextEditingController();
  final TextEditingController description = TextEditingController();

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
                leading: const Icon(Icons.camera),
                title: const Text('Take Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Pick from Gallery'),
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

  Future<void> addPost(List<String> imageUrl) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {


      await FirebaseFirestore.instance.collection('posts').add({
        'title': postTitle.text,
        'description': description.text,
        'imageUrl': imageUrl,
        'createdAt': FieldValue.serverTimestamp(),
        'userId': user?.uid,
      });
      print("Post added successfully!");
    } catch (e) {
      print("Error adding post: $e");
    }
  }

  void _handlePost() async {
    if (postTitle.text.isEmpty || description.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final rnum = Random();
    List<String> randomImage= [];
    for (int i = 1; i <= _selectedImages.length; i++) {
      randomImage.add(AllImages().image_li[rnum.nextInt(AllImages().image_li.length)]);

    }
    await addPost(randomImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 15),
              _buildTextFieldContainer("Title", "Enter title", postTitle),
              const SizedBox(height: 25),
              _buildTextFieldContainer(
                  "Description", "Enter description", description),
              const SizedBox(height: 20),

              // Dynamically generated upload containers
              Column(
                children: _selectedImages
                    .asMap()
                    .entries
                    .map((entry) =>
                    _buildUploadContainer(entry.key, entry.value))
                    .toList(),
              ),

              const SizedBox(height: 10),

              // Button to add more upload containers
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: _showImagePickerDialog,
                  child: const Text("Add pics"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black54),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Post button
              SizedBox(
                width: 200,
                height: 50,
                child: FilledButton(
                  onPressed: _handlePost,
                  child: const Text("Post"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable Text Field Container
  Widget _buildTextFieldContainer(
      String title, String hint, TextEditingController controller) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
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
            controller: controller,
          ),
        ],
      ),
    );
  }

  // Upload Image Container (Dynamically created)
  Widget _buildUploadContainer(int index, File imageFile) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 270),
            child: Text("Upload Here",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ),
          const SizedBox(height: 10),

          // Show selected image
          InkWell(
            onTap: _showImagePickerDialog,
            child: Image.file(imageFile,
                width: 370, height: 200, fit: BoxFit.cover),
          ),

          const SizedBox(height: 10),

          // Remove Image Button
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: () {
                setState(() {
                  _selectedImages.removeAt(index);
                });
              },
              child: const Text("Remove"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
