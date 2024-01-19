import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/_core/utils/date_format.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/pages/chat_room/chat_menu/chat_menu_main_page.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chat_room/other_chat_view_model.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/chat_menu_icon.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/my_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/other_chat.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/time_line.dart';

class VacantChatRoomPage extends ConsumerStatefulWidget {
  final ValueNotifier<List<String>>? photoList;

  VacantChatRoomPage({
    this.photoList,
    Key? key,
  }) : super(key: key);

  @override
  _VacantChatRoomPageState createState() => _VacantChatRoomPageState();
}

class _VacantChatRoomPageState extends ConsumerState<VacantChatRoomPage> {
  final TextEditingController _textController = TextEditingController();
  double bottomInset = 0.0;
  bool isPopupVisible = false;

  File? _selectedImage;
  List<File> allImage = [];
  List<String> encodedAllImage = [];

  @override
  Widget build(BuildContext context) {
    SessionUser user = ref.read(sessionProvider);
    ParamStore paramStore = ref.read(paramProvider);

    List<MessageDTO> dto = [];
    MessageDTO user1 =
        MessageDTO(content: "", userId: paramStore.friendDTO!.userId!);
    dto.add(user1);

    return Scaffold(
      backgroundColor: primaryColor02,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          paramStore.chatroomDTO!.chatName!,
          style: h3(),
        ),
      ),
      endDrawer: ChatRoomHamburger(messages: dto),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    TimeLine(time: getCurrentDay()),
                    //나중에 동적으로 처리해야함
                    SizedBox(
                      height: mediumGap,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 80,
            color: Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: smallGap,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isPopupVisible = !isPopupVisible; // 클릭할 때마다 반전
                    });
                  },
                  child: Image.asset(
                    "assets/icons/plus_icon.png",
                    fit: BoxFit.cover,
                    width: 35,
                    height: 35,
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(30), // border-radius 값 조절
                      border: Border.all(
                        color: Colors.grey, // 테두리 색상
                      ),
                    ),
                    child: TextField(
                      controller: _textController,
                      maxLines: 1,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        suffix: Container(
                          width: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/icons/chat_smile_icon.png",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                                color: basicColorB9,
                              ),
                              SizedBox(
                                width: smallGap,
                              ),
                              Image.asset(
                                "assets/icons/hash_icon.png",
                                fit: BoxFit.cover,
                                width: 30,
                                height: 30,
                                color: basicColorB9,
                              ),
                            ],
                          ),
                        ),
                      ),
                      onSubmitted: _handleSubmitted,
                    ),
                  ),
                ),
                SizedBox(
                  width: smallGap,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isPopupVisible,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: basicColorW),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_01.png",
                                text: "앨범",
                                onTap: () {
                                  _pickImageFromGallery();
                                },
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_02.png",
                                text: "카메라",
                                onTap: () {
                                  _pickImageFromCamera();
                                },
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_03.png",
                                text: "일정",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_04.png",
                                text: "지도",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_05.png",
                                text: "연락처",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_06.png",
                                text: "파일",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_07.png",
                                text: "캡쳐",
                              ),
                              ChatMenuIcon(
                                imagePath: "assets/icons/chat_menu_icon_08.png",
                                text: "송금",
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(text) {
    _textController.clear(); // 1
    ref.read(otherChatProvider.notifier).addMessage(text);
    setState(() {
      // 2
    });
  }

  void _pickImageFromGallery() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      Uint8List temp = await pickedImage.readAsBytes();
      List<int> real = temp.toList();
      String completeEncoded = base64Encode(real);

      // Firestore에 이미지 업로드
      // await ref.read(otherChatProvider.notifier).addPhoto(completeEncoded);

      // 이미지 목록 및 photoList 업데이트
      setState(() {
        _selectedImage = File(pickedImage.path);

        List<File> temp = allImage;
        temp.add(_selectedImage!);

        encodedAllImage.add(completeEncoded);
        Logger().d("${encodedAllImage} + 빈 챗");
        allImage = temp;
      });

      widget.photoList!.value = encodedAllImage;
      Logger().d("${widget.photoList!.value.length}  룰루");
    }
  }

  void _pickImageFromCamera() async {
    XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      Uint8List temp = await pickedImage.readAsBytes();
      List<int> real = temp.toList();
      String completeEncoded = base64Encode(real);
      setState(() {
        _selectedImage = File(pickedImage.path);

        List<File> temp = allImage;
        temp.add(_selectedImage!);

        encodedAllImage.add(completeEncoded);
        Logger().d(encodedAllImage);
        allImage = temp;
      });

      widget.photoList!.value = encodedAllImage;
      Logger().d(widget.photoList!.value.length);
    }
  }
}
