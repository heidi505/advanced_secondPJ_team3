import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/move.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/provider/param_provider.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/chat_notify/chat_notify_view_model.dart';

import '../notify_write_view_model.dart';

class NotifyWirteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController _textEditingController;


  NotifyWirteAppBar({Key? key, required TextEditingController textEditingController})
      : _textEditingController = textEditingController,
        super(key: key);

  // NotifyWirteAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("글 작성하기"),
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.ChatNotifyPage);
        },
        icon: Icon(Icons.close),
      ),
      actions: [
        Container(
            width: 50,
            child: Consumer(
              builder: (context, ref, child) {
                ChatNotifyModel? model = ref.watch(chatNotifyProvider);

                // 이 부분에서 sessionProvider를 직접 사용
                SessionUser? session = ref.read(sessionProvider);
                if (session != null) {
                  Logger().d("userId 뭐야야 : ${session.user?.id}");
                }
                ParamStore paramStore = ref.read(paramProvider);
                return TextButton(
                  onPressed: () {

                    String submitText = _textEditingController.text; //텍스트 연결
                    _notifySubmit(_textEditingController); //함수에 연결 텍스트 보내주기
                    ref.read(paramProvider).addNotifyText(submitText); // 텍스트 파람에 넣어주기
                    //ref.read(paramProvider).addNotifyChatId(chatId);
                    ref.read(chatNotifyWriteProvider.notifier).addChatNotify(submitText);//addChatNotify 에 텍스트 넣어주기
               //addChatNotify 에 텍스트 넣어주기
                    //Logger().d("진짜 모르겠다 도대체 뭔데 진짜로 제발 $chatId");
                    Logger().d("'+++++Submitted Text++++++: $submitText'"); //ok

                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide.none,
                  ),
                  child: Text(
                    "완료",
                    style: TextStyle(color: basicColorB9),
                  ),
                );
              },
            ),
        ),

        //액션이 크기 무한으로 잡혀 있어서 너비를 정해줘야 함
        SizedBox(
          width: smallGap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}

void _notifySubmit(TextEditingController textController) {
  Logger().d("뭔데이거 호출안되는거가");
  //
  // ref.read(chatNotifyWriteProvider.notifier).addChatNotify(textController);
  // setState(() {
  //
  // });
}

