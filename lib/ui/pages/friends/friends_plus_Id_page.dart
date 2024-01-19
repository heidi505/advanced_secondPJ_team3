import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';

class FriendsPlusIdPage extends ConsumerWidget {
  const FriendsPlusIdPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이메일로 친구 추가"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              onChanged: (value) {
                ref.read(paramProvider).addPhoneNumForSearch(value);
              },
              decoration: InputDecoration(
                hintText: "친구 카카오톡 이메일",
              ),
            ),
            SizedBox(height: 30),
            TextButton(onPressed: () {
              ref.read(friendAddProvier.notifier).fetchSearchingFriend();
            }, child: Text("확인")),
          ],
        ),
      ),
    );
  }
}
