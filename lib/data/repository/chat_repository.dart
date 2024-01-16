import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/utils/date_format.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/dto/response_dto.dart';
import 'package:team3_kakao/data/model/message.dart';

class ChatRepository{


  Future<List<MessageDTO>> getInitMessages(String chatRoomDocId, int userId) async {
    final db = FirebaseFirestore.instance;

    QuerySnapshot<Map<String, dynamic>> initMessages = await db
        .collection("ChatRoom$userId")
        .doc(chatRoomDocId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .get();

    List<MessageDTO> dtoList = [];

    for(var message in initMessages.docs){
      MessageDTO dto = new MessageDTO.fromJson(message.data(), message.id);

      dtoList.add(dto);
    }

    return dtoList;
  }

  //통신
  Stream<List<MessageDTO>> fetchMessages(String chatRoomDocId, int userId){
    final db = FirebaseFirestore.instance;

    Stream<QuerySnapshot<Map<String, dynamic>>> stream = db
        .collection("ChatRoom$userId")
        .doc(chatRoomDocId)
        .collection("messages")
        .orderBy("createdAt", descending: false)
        .snapshots();


    return stream.map((snapshot){
      return snapshot.docs.map((e) {
        return MessageDTO.fromJson(e.data(), e.id);
      }).toList();
    });

  }

  //userId 받아야함!!
  Future<void> addMessage(String text, int userId, String chatRoomDocId) async {
    final db = FirebaseFirestore.instance;
    message msg = message(content: text,userId: userId, createdAt: Timestamp.now());

    final docRef = await db
        .collection("ChatRoom$userId")
        .doc(chatRoomDocId)
        .collection("messages")
        .add(msg.toJson());

  }

  Future<void> setChatting(String chatDocId, String func, int userId) async{
    final db = FirebaseFirestore.instance;

    final chatDoc = await db
        .collection("ChatRoom$userId")
        .doc(chatDocId);

    //alarm이면 기본값 true로 하는 로직 세팅해야함



    db.runTransaction((transaction)async{
      final snapshot = await transaction.get(chatDoc);

     bool currentState = snapshot.data()![func];
     bool newFunc = !currentState;

      transaction.update(chatDoc, {func : newFunc});
    });
  }

  Future<void> deleteChat(String chatDocId, int userId) async {
    final db = FirebaseFirestore.instance;

    await db
        .collection("ChatRoom$userId")
        .doc(chatDocId)
        .delete();
  }











}