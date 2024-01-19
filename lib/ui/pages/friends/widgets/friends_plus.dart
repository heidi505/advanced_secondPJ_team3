import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:team3_kakao/_core/constants/color.dart';
import 'package:team3_kakao/_core/constants/size.dart';
import 'package:team3_kakao/data/model/profile.dart';
import 'package:team3_kakao/data/provider/session_provider.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_Id_page.dart';
import 'package:team3_kakao/ui/pages/friends/friends_plus_add_Page.dart';

class FriendsPlusIcon extends StatelessWidget {
  String text;
  Widget? linkto;
  String svg;

  FriendsPlusIcon(
      {required this.text, required this.linkto, required this.svg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => linkto!));
      },
      child: Container(
          child: Column(
        children: [
          SvgPicture.asset(
            "$svg",
            width: 25,
            height: 25,
          ),
          Text("$text"),
        ],
      )),
    );
  }
}

// QR코드 나오는 영역
class PlusMainBody extends ConsumerStatefulWidget {
  final Profile myProfile;

  const PlusMainBody({Key? key, required this.myProfile}) : super(key: key);

  @override
  ConsumerState<PlusMainBody> createState() => _PlusMainBodyState();
}

class _PlusMainBodyState extends ConsumerState<PlusMainBody> {
  bool _qrGenerated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SessionUser session = ref.read(sessionProvider);
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // qr코드하면 qr코드로 대체
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: pointColor07,
                  ),
                  height: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(xsmallGap),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("${session.user!.nickname}"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: smallGap,
                            right: mediumGap,
                            left: mediumGap),
                        child: Container(
                          child: QrImageView(
                            backgroundColor: basicColorW,
                            data: 'This is a simple QR code',
                            version: QrVersions.auto,
                            gapless: false,
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(height: 30),
              Image.asset(
                "assets/icons/circle_share_icon.png",
                height: largeGap,
                width: largeGap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 친추 방법 나오는 영역
class PlusMainIcon extends StatelessWidget {
  const PlusMainIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: basicColorW,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FriendsPlusIcon(
                text: "QR 코드", linkto: null, svg: "assets/icons/qr_icon.svg"),
            FriendsPlusIcon(
              text: "연락처로 추가",
              linkto: FriendsPlusAddPage(),
              svg: "assets/icons/contact_icon.svg",
            ),
            FriendsPlusIcon(
              text: "이메일로 추가",
              linkto: FriendsPlusIdPage(),
              svg: "assets/icons/id_add_icon.svg",
            ),
            FriendsPlusIcon(
              text: "추천 친구",
              linkto: null,
              svg: "assets/icons/friend_add_icon.svg",
            ),
          ],
        ),
      ),
    );
  }
}

// 앱바
class PlusMainAppBar extends StatelessWidget {
  const PlusMainAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text('친구 추가'),
        ],
      ),
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
