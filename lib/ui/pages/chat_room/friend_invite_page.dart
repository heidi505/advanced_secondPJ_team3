import 'package:flutter/material.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/friend_add.dart';

class FriendInvitePage extends StatefulWidget {
  const FriendInvitePage({Key? key}) : super(key: key);

  @override
  _FriendInvitePageState createState() => _FriendInvitePageState();
}

class _FriendInvitePageState extends State<FriendInvitePage> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextNotEmpty = false;

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
        title: Text("대화상대"),
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icons/close.png",
              fit: BoxFit.cover,
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(width: 12),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: null,
            title: Padding(
              padding: const EdgeInsets.only(top: 100.0), // Adjust top padding
              child: Column(
                children: [
                  _buildFriendRow(),
                  _buildTextFormField(),
                ],
              ),
            ),
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriendRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          friend_add(),
          SizedBox(width: smallGap),
          friend_add(),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: _textEditingController,
      autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        hintText: '이름으로 검색',
        hintStyle: TextStyle(color: formColor),
        filled: true,
        fillColor: formColor.withOpacity(0.2),
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
        contentPadding: EdgeInsets.all(10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
