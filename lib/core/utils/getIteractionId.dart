import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  // For example, assume the user IDs are:
  String userId1 = "rx45JS5bOUUkKKvhR7Ncib1WoBJ2";
  String userId2 = "7qU3U7LhASUAgYv2Mz2lU3VOogc2";

  print(await getCreationOrder(userId1, userId2));
}

Future<String> getCreationOrder(String userId1, String userId2) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Get the creation times for both users from Firestore
    DocumentSnapshot doc1 = await firestore.collection('users').doc(userId1).get();
    DocumentSnapshot doc2 = await firestore.collection('users').doc(userId2).get();

    if (!doc1.exists || !doc2.exists) {
      return "One or both users not found.";
    }

    // Extract creation times from Firestore document
    DateTime creationTime1 = (doc1.data() as Map)['creationTime'].toDate();
    DateTime creationTime2 = (doc2.data() as Map)['creationTime'].toDate();

    // Compare and return the user who was created first
    if (creationTime1.isBefore(creationTime2)) {
      return '${userId1}_${userId2}';
    } else {
      return '${userId2}_${userId1}';
    }
  } catch (e) {
    return "Error: $e";
  }
}
