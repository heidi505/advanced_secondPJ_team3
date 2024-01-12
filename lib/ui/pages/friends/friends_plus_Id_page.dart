import 'package:flutter/material.dart';

class FriendsPlusIdPage extends StatelessWidget {
  const FriendsPlusIdPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("카카오톡 ID로 추가"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "친구 카카오톡 ID",
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("내 아이디"),
                Expanded(
                    child: Text(
                  "yap3",
                  textAlign: TextAlign.end,
                ))
              ],
            ),
            TextButton(onPressed: () {}, child: Text("확인")),
          ],
        ),
      ),
    );
  }
}
