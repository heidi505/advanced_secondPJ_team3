import 'package:flutter/material.dart';
import 'package:kakao_map_plugin/kakao_map_plugin.dart';

class ChatMapPage extends StatefulWidget {
  const ChatMapPage({Key? key}) : super(key: key);

  @override
  _ChatMapPageState createState() => _ChatMapPageState();
}

class _ChatMapPageState extends State<ChatMapPage> {
  String kakaoMapKey = '168ec3675e3d04ba8aeba2bcfdf78e79';

  @override
  void initState() {
    super.initState();
    AuthRepository.initialize(appKey: kakaoMapKey);
  }

  TextEditingController _textEditingController = TextEditingController();
  bool _isTextNotEmpty = false;

  void _updateTextStatus() {
    setState(() {
      _isTextNotEmpty = _textEditingController.text.isNotEmpty;
    });
  }

  Set<Marker> markers = {};
  late KakaoMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("지도"),
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text("X"),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                autovalidateMode: AutovalidateMode.always,
                decoration: InputDecoration(
                  hintText: '장소명으로 검색',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.3),
                  suffixIcon: _isTextNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _textEditingController.clear();
                            });
                          },
                        )
                      : null,
                  border: InputBorder.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: KakaoMap(
                    onMapCreated: ((controller) async {
                      mapController = controller;

                      markers.add(
                        Marker(
                          markerId: UniqueKey().toString(),
                          latLng: await mapController.getCenter(),
                        ),
                      );
                      setState(() {});
                    }),
                    markers: markers.toList(),
                    center: LatLng(37.3608681, 126.9306506),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
