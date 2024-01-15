import 'package:flutter/material.dart';

class ChatNameSetPage extends StatefulWidget {
  const ChatNameSetPage({Key? key}) : super(key: key);

  @override
  _ChatNameSetPageState createState() => _ChatNameSetPageState();
}

class _ChatNameSetPageState extends State<ChatNameSetPage> {
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("채팅방 이름"),
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
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
                hintText: '가라채팅',
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
