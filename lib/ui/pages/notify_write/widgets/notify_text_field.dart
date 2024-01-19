import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/ui/pages/notify_write/notify_write_view_model.dart';

class NotifyTextField extends ConsumerStatefulWidget {
  const NotifyTextField({
    Key? key,
    required TextEditingController textEditingController,
    required Function(String) onSubmitted,
  })  : _textEditingController = textEditingController,
        _onSubmitted = onSubmitted,
        super(key: key);

  final TextEditingController _textEditingController;
  final Function(String) _onSubmitted;

  @override
  _NotifyTextFieldState createState() => _NotifyTextFieldState();
}

class _NotifyTextFieldState extends ConsumerState<NotifyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(smallGap),
      child: Container(
        child: TextField(
         controller: widget._textEditingController,
          onSubmitted: widget._onSubmitted,
          decoration: InputDecoration(
            hintText: "멤버들과 공유하고 싶은 소식을 남겨보세요.",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

// void _notifySubmit(String textController) {
//   widget._textEditingController.clear();
//   ref.read(chatNotifyWriteProvider.notifier).addChatNotify(textController);
//   Logger().d("이거 도대체 뭔값이길래 ${textController}");
//   setState(() {
//   });
// }
}
