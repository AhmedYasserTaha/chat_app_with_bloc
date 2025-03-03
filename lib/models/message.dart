import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat_app/constants.dart';

class Message {
  final String message;
  final String id;
  final Timestamp createdAt;

  Message(this.message, this.id, this.createdAt);

  factory Message.fromJson(jsonData) {
    return Message(
      jsonData[kMessage]?.toString() ?? "", // تأكد أن الرسالة ليست null
      jsonData['id']?.toString() ?? "unknown", // تأكد أن الـ id ليس null
      jsonData[kCreatedAt] is Timestamp
          ? jsonData[kCreatedAt]
          : Timestamp.now(), // تأكد أن createdAt من نوع Timestamp
    );
  }
}
