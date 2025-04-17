import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_social_media/core/constants/images_contants.dart';
import 'package:google_api_availability/google_api_availability.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int likeCount = 999;
  String? currentUser;
  List<DocumentSnapshot> posts = [];
  bool isLoading = true;


  void checkGooglePlayServices() async {
    GooglePlayServicesAvailability availability = await GoogleApiAvailability.instance.checkGooglePlayServicesAvailability();

    if (availability == GooglePlayServicesAvailability.success) {
      // Google Play Services are available
    } else {
      // Google Play Services are not available
      // You might want to prompt the user to update or install them
    }
  }


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
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    currentUser = user?.uid;
    fetchPosts();
    checkGooglePlayServices();
  }

  // Fetch username from the 'users' collection using the userId from post document
  Future<String> getUsername(String userId) async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      return userDoc.data()?['username'] ?? 'Unknown User';
    } catch (e) {
      print("Error fetching username: $e");
      return 'Unknown User';
    }
  }

  Future<void> fetchPosts() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('userId', isNotEqualTo: currentUser)
          .get();

      setState(() {
        posts = snapshot.docs;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching posts: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            // Upper Circle Row (Your Story)
            SizedBox(
              height: 140,
              child: ListView.builder(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset(AllImages.profile),
                          ),
                        ),
                        const Text("Your story"),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Posts ListView
            SizedBox(
              height: 550,

              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: posts.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = posts[index].data() as Map<String, dynamic>;
              
                  final title = data['title'] ?? '';
                  final description = data['description'] ?? '';
                  final imageUrls = List<String>.from(data['imageUrl'] ?? []);
                  final userId = data['userId']; // userId of the poster
              
                  return FutureBuilder<String>(
                    future: getUsername(userId), // Fetch username based on userId
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
              
                      if (snapshot.hasError) {
                        return const Center(child: Text("Error loading username"));
                      }
              
                      String username = snapshot.data ?? 'Unknown User';
              
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 8),
                        child: Column(
                          children: [
                            // Row for username and profile picture
                            Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  width: 35,
                                  height: 35,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.asset(AllImages.profile),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    username, // Display the username
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.only(top: 15),
                                  width: 20,
                                  height: 34,
                                  child: Image.asset('assets/3-dots.png'),
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    "San Francisco",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (imageUrls.isNotEmpty)
                              Image.asset(imageUrls[0]), // Changed to Image.asset
                            const SizedBox(height: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 5),
                                Text(description,
                                    style: const TextStyle(fontSize: 14)),
                                const SizedBox(height: 10),
                              ],
                            ),
                            Row(
                              children: [
                                _buildActionButton(
                                  icon: Icons.favorite,
                                  label: formatLikeCount(likeCount),
                                  onTap: () {
                                    setState(() {
                                      likeCount++;
                                    });
                                  },
                                ),
                                _buildActionButton(
                                  icon: Icons.comment,
                                  label: '1997',
                                ),
                                _buildActionButton(
                                  icon: Icons.share,
                                  label: '1997',
                                ),
                                const Spacer(),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  margin: const EdgeInsets.only(left: 10),
                                  child: const Icon(Icons.save),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    VoidCallback? onTap,
  }) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      margin: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, size: 18),
            Text(label),
          ],
        ),
      ),
    );
  }
}
