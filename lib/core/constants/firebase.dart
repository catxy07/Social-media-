import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<UserCredential?> signUpWithEmail(
    {required String email,
    required String password,
}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await FirebaseFirestore.instance
        .collection('user')
        .doc(userCredential.user!.uid)
        .set(
            {'email': email, 'password': password});
    return userCredential;
  } catch (e) {
    print("Error is signUp $e");
    return null;
  }
}

// Future<UserCredential?> signUpWithEmail2(
//     {required String email,
//     required String password,
//     required String phoneNumber}) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .verifyPhoneNumber(
//             verificationCompleted: (phoneAuthCredential){
//
//             },
//             verificationFailed: verificationFailed,
//             codeSent: codeSent,
//             codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//
//     await FirebaseFirestore.instance
//         .collection('user')
//         .doc(userCredential.user!.uid)
//         .set(
//             {'phoneNumber': phoneNumber});
//   } catch (e) {
//     print("Error is signUp $e");
//     return null;
//   }
// }

Future<UserCredential?> loginWithEmail(
    {required String email, required String password}) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential;
  } catch (e) {
    print('Error is $e');
    return null;
  }
}

Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
}
