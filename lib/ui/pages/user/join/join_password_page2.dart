// import 'package:flutter/material.dart';
// import 'package:team3_kakao/ui/widgets/join/join_button_form_field.dart';
// import 'package:team3_kakao/ui/widgets/join/join_text_form_field.dart';
//
// import '../../../../_core/constants/size.dart';
// import '../../../../_core/utils/validator_util.dart';
//
// class JoinPassWordPage extends StatelessWidget {
//   const JoinPassWordPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(mediumGap),
//         child: ListView(
//           children: [
//             JoinTitle(text: "카카오계정 로그인에 사용할 \n비밀번호를 등록해 주세요."),
//             TextFormHint(text: "카카오계정"),
//             InfoText(text: "wildlegion@naver.com\n"),
//             TextFormHint(text: "비밀번호"),
//             InsertPassword(
//               text: "비밀번호 입력 (8~32자리)",
//               validator: validatePassword,
//             ),
//             InsertPassword2(
//               text: "비밀번호 재입력",
//               validator: (value) {
//                 // 두 번째 입력 필드의 유효성 검사
//                 if (value!.isEmpty) {
//                   return "패스워드 재입력 공백이 들어갈 수 없습니다.";
//                 } else if (value != _passwordController.text) {
//                   return "패스워드가 일치하지 않습니다.";
//                 } else {
//                   return null;
//                 }
//               },
//             ),
//             SubText(text: "· 비밀번호는 8~32자리의 영문 대소문자, 특수문자를 조합하여 설정해 주세요."),
//             SubText(text: "· 다른 사이트에서 사용하는 것과 동일하거나 쉬운 비밀번호는 사용하지 마세요."),
//             SubText(text: "· 안전한 계정 사용을 위해 비밀번호는 추가적으로 변경해 주세요.\n"),
//             ProfilePageButton(
//               text: "다음",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
