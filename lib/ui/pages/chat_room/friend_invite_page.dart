import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/friend_add.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/friend_add_list.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_title.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';
import 'package:team3_kakao/ui/widgets/appbar/sliver_app_bar_delegate.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';
import 'package:team3_kakao/ui/widgets/text_form/add_search_text_form_field.dart';

class FriendInvitePage extends ConsumerStatefulWidget {
  const FriendInvitePage({Key? key}) : super(key: key);

  @override
  _FriendInvitePageState createState() => _FriendInvitePageState();
}

class _FriendInvitePageState extends ConsumerState<FriendInvitePage> {
  TextEditingController _textEditingController = TextEditingController();
  bool _isTextNotEmpty = false;
  MainDTO? mainDTO;
  bool isChecked = false;

  void _updateTextStatus() {
    setState(() {
      _isTextNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    MainPageModel? model = ref.watch(mainProvider);

    if (model == null) {
      return CircularProgressIndicator();
    }

    mainDTO = model!.mainDTO;

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
          _buildSliverAppBar(),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 20,
        maxHeight: 120,
        child: Container(
          decoration: BoxDecoration(
            color: basicColorW,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildFriendAdd(),
                AddSearchTextFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverList() {
    return SliverFillRemaining(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FriendTItle(count: mainDTO!.friendList!.length),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return FriendAddList(isChecked: isChecked);
                },
                childCount: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriendAdd() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          FriendAdd(),
          SizedBox(width: smallGap),
          FriendAdd(),
        ],
      ),
    );
  }
}
