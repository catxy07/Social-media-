import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final String senderId;
  final String receiverId;
  final String chatMsg;
  final DateTime chatTime;

  Chat({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.chatMsg,
    required this.chatTime,
  });

  // Convert Firestore document to Chat object
  factory Chat.fromMap(String docId, Map<String, dynamic> map) {
    return Chat(
      id: docId,
      senderId: map['senderId'] ?? '',
      receiverId: map['receiverId'] ?? '',
      chatMsg: map['chatMsg'] ?? '',
      chatTime: (map['chatTime'] as Timestamp).toDate(),
    );
  }

  // Convert Chat object to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'chatMsg': chatMsg,
      'chatTime': chatTime,
    };
  }
}
