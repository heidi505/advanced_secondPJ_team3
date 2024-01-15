import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/data/dto/friend_dto/main_dto.dart';
import 'package:team3_kakao/ui/pages/friends/widgets/friends_plus.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';

class FriendsPlusMainPage extends ConsumerWidget {
  const FriendsPlusMainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MainPageModel? model = ref.watch(mainProvider);

    MainDTO? mainDTO = model!.mainDTO;

    return Material(
      type: MaterialType.transparency,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PlusMainAppBar(),
          PlusMainIcon(),
          PlusMainBody(myProfile: mainDTO!.userProfile!),
        ],
      ),
    );
  }
}
