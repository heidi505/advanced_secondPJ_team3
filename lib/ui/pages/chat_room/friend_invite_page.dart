import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/provider/Friend_search_provider.dart';
import 'package:team3_kakao/data/provider/add_friend_to_chat_provider.dart';
import 'package:team3_kakao/ui/pages/chat_room/other_chat_view_model.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/friend_add.dart';
import 'package:team3_kakao/ui/pages/chat_room/widgets/friend_add_list.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friend_title.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';
import 'package:team3_kakao/ui/widgets/appbar/sliver_app_bar_delegate.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/open_profile_image.dart';
import 'package:team3_kakao/ui/widgets/text_form/add_search_text_form_field.dart';

import '../../../_core/constants/move.dart';

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
    FriendSearchModel? searchModel = ref.watch(searchProvider);
    AddFriendToChatModel? pickedOne = ref.watch(addFriendToChatProvider);

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
              ref.read(otherChatProvider.notifier).addChatUser();
              Navigator.pushNamed(context, Move.chatRoomPage);
            },
            child: Image.asset(
              "assets/icons/check_icon.png",
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
          _buildSliverAppBar(pickedOne!.friendsToAdd!),
          _buildSliverList(),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(List<FriendsDTO> friends) {
    ref.watch(addFriendToChatProvider);
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
                Expanded(child: _buildFriendAdd(friends)),
                AddSearchTextFormField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverList() {
    List<dynamic> friends;
    FriendSearchModel? searchModel = ref.watch(searchProvider);
    int userId;
    if (searchModel!.friendSerchResponseDTO!.isEmpty) {
      friends = ref.read(mainProvider)!.mainDTO!.friendList!;
    } else {
      friends = searchModel!.friendSerchResponseDTO!
          .map((e) => FriendsDTO(
              nickname: e.nickname, userId: e.id, profileImage: e.profileImage))
          .toList();
    }

    return SliverFillRemaining(
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return FriendAddList(
                    isChecked: isChecked, friend: friends[index]);
              },
              childCount: friends.length,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFriendAdd(List<FriendsDTO> friends) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FriendAdd(pickedFriend: friends[index]);
          },
          itemCount: friends.length,
        ),
      ),
    );
  }
}
