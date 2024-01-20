import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:team3_kakao/ui/pages/friends/friends_add_view_model.dart';
import 'package:team3_kakao/ui/pages/main_view_model.dart';
import 'package:team3_kakao/ui/pages/user/find/find_account_page.dart';
import 'package:team3_kakao/ui/pages/user/find/find_password_page.dart';

import '../../../_core/constants/size.dart';
import '../../pages/user/find/find_password_reset_page.dart';
import '../../pages/user/join/join_check_page.dart';

// class LoginButton extends StatelessWidget {
//   String text;
//
//   LoginButton({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
//       child: TextButton(onPressed: () {}, child: Text("$text")),
//     );
//   }
// }

// class JoinButton extends StatelessWidget {
//   String text;
//
//   JoinButton({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
//       child: TextButton(
//           onPressed: () {
//             // 버튼 클릭 시 join_agree_page.dart로 이동
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => JoinCheckPage()),
//             );
//           },
//           child: Text("$text")),
//     );
//   }
// }

class FindButton extends StatelessWidget {
  String account;
  String password;

  FindButton({required this.account, required this.password});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindAccountPage()),
              );
            },
            child: Text("$account"),
          ),
          SizedBox(width: 10), // 간격 조절
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FindPasswordReset()),
              );
            },
            child: Text("$password"),
          ),
        ],
      ),
    );
  }
}

class FindAccountButton extends ConsumerWidget {
  String text;

  FindAccountButton({required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(
          onPressed: () {
            if (text == "친구 추가") {
              ref.read(mainProvider.notifier).addFriend();
            }
          },
          child: Text("$text")),
    );
  }
}

class FindPasswordButton extends StatelessWidget {
  String text;

  FindPasswordButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: xsmallGap, bottom: xsmallGap),
      child: TextButton(onPressed: () {}, child: Text("$text")),
    );
  }
}
