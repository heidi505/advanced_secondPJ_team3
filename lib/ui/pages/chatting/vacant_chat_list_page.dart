import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/font.dart';
import 'package:team3_kakao/_core/constants/http.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/dto/chat_dto/chatting_list_page_dto.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chat_room/other_chat_view_model.dart';
import 'package:team3_kakao/ui/pages/chatting/chat_name_set_page.dart';
import 'package:team3_kakao/ui/pages/chatting/chatting_list_page_view_model.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_menu_modal.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chat_person_count.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/chatting_count.dart';
import 'package:team3_kakao/ui/pages/chatting/widget/group_profile.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/chatting_item.dart';
import 'package:team3_kakao/ui/widgets/chatting_items/profile_image.dart';

class VacantChatListPage extends ConsumerWidget {
  VacantChatListPage({super.key});

  bool isFirst = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body:CustomScrollView(
        slivers: [SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: pointColor03.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/chat_empty_icon.png",
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                        SizedBox(
                          height: smallGap,
                        ),
                        Text(
                          "개설된 채팅방이 없습니다",
                          style: h4(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
