import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendMessage({required String message, required String email}) {
    try {
      messages.add(
        {
          kMessage: message,
          kCreatedAt: Timestamp.now(), // ✅ تعديل هنا
          'id': email
        },
      );
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  void getMessages() {
    // ✅ تعديل الاسم هنا
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        List<Message> messagesList = [];

        for (var doc in event.docs) {
          messagesList.add(Message.fromJson(doc));
        }

        emit(ChatSuccess(messages: messagesList)); // ✅ تحديث الواجهة تلقائيًا
      },
    );
  }
}
