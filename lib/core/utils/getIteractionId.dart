import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   // For example, assume the user IDs are:
//   String userId1 = "rx45JS5bOUUkKKvhR7Ncib1WoBJ2";
//   String userId2 = "7qU3U7LhASUAgYv2Mz2lU3VOogc2";
//
//   print(await compareUserIds(userId1, userId2));





// Future<String> compareUserIds(String userId1, String userId2) async {
//   final firestore = FirebaseFirestore.instance;
//
//   try {
//     // Fetch user documents
//     var userDoc1 = await firestore.collection('user').doc(userId1).get();
//     var userDoc2 = await firestore.collection('user').doc(userId2).get();
//
//     // Check if documents exist
//     if (!userDoc1.exists || !userDoc2.exists) {
//       throw Exception("One or both user IDs do not exist");
//     }
//
//     // Get creation timestamps
//     DateTime createdAt1 = userDoc1.get('createdAt').toDate();
//     DateTime createdAt2 = userDoc2.get('createdAt').toDate();
//
//     // Compare timestamps
//     return createdAt1.isBefore(createdAt2)
//         ? "${userId1}_${userId2}"
//         : "${userId2}_${userId1}";
//   } catch (e) {
//     print("Error: $e");
//     return "Error fetching user data";
//   }
// }




Future<String> compareUserIds(String userId1, String userId2) async {
  final firestore = FirebaseFirestore.instance;

  try {
    // Fetch user documents
    var userDoc1 = await firestore.collection('user').doc(userId1).get();
    var userDoc2 = await firestore.collection('user').doc(userId2).get();

    // Check if documents exist
    if (!userDoc1.exists || !userDoc2.exists) {
      throw Exception("One or both user IDs do not exist");
    }

    // Compare based on document IDs
    return userId1.compareTo(userId2) < 0
        ? "${userId1}_${userId2}"
        : "${userId2}_${userId1}";
  } catch (e) {
    print("Error: $e");
    return "Error fetching user data";
  }
}
