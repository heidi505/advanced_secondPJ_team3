import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/text_form/friend_search_text_form_field.dart';
import 'package:team3_kakao/ui/widgets/text_form/add_search_text_form_field.dart';

class FriendSearchPage extends ConsumerStatefulWidget {
  List<FriendsDTO>? friendsList;

  FriendSearchPage({super.key, this.friendsList});

  @override
  _FriendSearchPageState createState() => _FriendSearchPageState();
}

class _FriendSearchPageState extends ConsumerState<FriendSearchPage> {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
  }

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
      backgroundColor: bgAndLineColor,
      appBar: AppBar(
        backgroundColor: bgAndLineColor,
        centerTitle: true,
        title: FriendSearchTextFormField(),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("취소"),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: formColor,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "친구 리스트",
                        style: h5(
                            color: basicColorB3, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 상태 관리 해야 하는 부분 - image 에러는 network로 돼있어서 상태 관리 해서 넣어야 합니다
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  child: ChattingItem(
                    ontap: () {
                      Navigator.pushNamed(context, Move.profilePage);
                    },
                    circular: 16.0,
                    imageWidth: 40,
                    imageHeight: 40,
                    imagePath: "assets/images/basic_img.jpeg",
                    title: "그노",
                    subTitle: "룰루",
                  ),
                ),
                childCount: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
