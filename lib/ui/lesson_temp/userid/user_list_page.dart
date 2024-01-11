import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/lesson_temp/userid/user_id_view_model.dart';
import 'package:team3_kakao/ui/lesson_temp/userid/user_list_view_model.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ListModel? model = ref.watch(listViewProvider);

    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemBuilder: (context, index){
                  return TextButton(
                      onPressed: (){
                        ref.read(listViewProvider.notifier).notifyList();
                      },
                      child: Text("유저 닉네임 리스트: ${model!.respDTO[index].userNickname}"));
                },
                itemCount: model!.respDTO.length))
      ],
    );
  }
}
