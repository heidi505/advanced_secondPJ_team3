class Chat {
  final String image;
  final String title;
  final String content;
  final String time;
  final String count;

  Chat(
      {required this.image,
      required this.title,
      required this.content,
      required this.time,
      required this.count});
}

final int imageNum = 0;
final String _img = "https://picsum.photos/id/${imageNum + 3}/200/300";

List<Chat> chats = [
  Chat(
    image: _img,
    title: "홍길동",
    content: "오늘 저녁에 시간 되시나요?",
    time: "오후 11:00",
    count: "0",
  ),
  Chat(
    image: _img,
    title: "정도전",
    content: "오늘 날씨가 참 맑네요.",
    time: "오전 09:30",
    count: "1",
  ),
];
