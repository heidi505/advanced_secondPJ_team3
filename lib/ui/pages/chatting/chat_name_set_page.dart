import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';

import '../../../data/dto/chat_dto/chatting_list_page_dto.dart';

class ChatNameSetPage extends ConsumerStatefulWidget {
  const ChatNameSetPage({Key? key}) : super(key: key);

  @override
  _ChatNameSetPageState createState() => _ChatNameSetPageState();
}

class _ChatNameSetPageState extends ConsumerState<ChatNameSetPage> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextNotEmpty = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateTextStatus);
  }

  void _updateTextStatus() {
    setState(() {
      _isTextNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {

    ParamStore paramStore = ref.read(paramProvider);
    SessionUser user = ref.read(sessionProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("채팅방 이름"),
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
              ref.read(chattingPageProvider.notifier).changeChatName(_textEditingController.text, paramStore.chatroomDTO!.chatDocId!, user.user!.id!);
              Navigator.pop(context);
            },
            child: Text("확인"),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textEditingController,
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                hintText: paramStore.chatroomDTO!.chatName!,
                suffixIcon: _isTextNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _textEditingController.clear();
                          });
                        },
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
