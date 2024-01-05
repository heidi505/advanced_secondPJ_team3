class User {
  final String backgroundImage;
  final String name;
  final String intro;

  User({
    required this.backgroundImage,
    required this.name,
    required this.intro,
  });
}

final int imageNum = 0;
final String _img = "https://picsum.photos/id/${imageNum + 1}/200/300";

User me = User(
  backgroundImage: _img,
  name: "김철수",
  intro: "고통없이는 얻는 것도 없다",
);

List<User> friends = [
  User(
    backgroundImage: _img,
    name: "홍길동",
    intro: "아버지라 불러도 되겠습니까",
  ),
  User(
    backgroundImage: _img,
    name: "정도전",
    intro: "앞이 보이겠습니까",
  ),
  User(
    backgroundImage: _img,
    name: "박태수",
    intro: "지금 어디에 와 있을까",
  ),
  User(
    backgroundImage: _img,
    name: "김상중",
    intro: "그런데 말입니다.",
  ),
  User(
    backgroundImage: _img,
    name: "김두한",
    intro: "4딸라",
  ),
  User(
    backgroundImage: _img,
    name: "심영",
    intro: "내가 고자라니",
  ),
  User(
    backgroundImage: _img,
    name: "교강용",
    intro: "더 이상의 자세한 설명은 생략한다.",
  ),
  User(
    backgroundImage: _img,
    name: "김환희",
    intro: "뭣이 중헌디",
  ),
  User(
    backgroundImage: _img,
    name: "뚱이",
    intro: "아뇨, 뚱인데요?",
  ),
  User(
    backgroundImage: _img,
    name: "김주원",
    intro: "이게 최선입니까 확실해요?",
  ),
];
