class UserMock {
  final String backgroundImage;
  final String name;
  final String intro;

  UserMock({
    required this.backgroundImage,
    required this.name,
    required this.intro,
  });
}

// 가져와야하는 것들?



final int imageNum = 0;
final String _img = "https://picsum.photos/id/${imageNum + 1}/200/300";

UserMock me = UserMock(
  backgroundImage: _img,
  name: "김철수",
  intro: "고통없이는 얻는 것도 없다",
);

List<UserMock> friends = [
  UserMock(
    backgroundImage: _img,
    name: "홍길동",
    intro: "아버지라 불러도 되겠습니까",
  ),
  UserMock(
    backgroundImage: _img,
    name: "정도전",
    intro: "앞이 보이겠습니까",
  ),
  UserMock(
    backgroundImage: _img,
    name: "박태수",
    intro: "지금 어디에 와 있을까",
  ),
  UserMock(
    backgroundImage: _img,
    name: "김상중",
    intro: "그런데 말입니다.",
  ),
  UserMock(
    backgroundImage: _img,
    name: "김두한",
    intro: "4딸라",
  ),
  UserMock(
    backgroundImage: _img,
    name: "심영",
    intro: "내가 고자라니",
  ),
  UserMock(
    backgroundImage: _img,
    name: "교강용",
    intro: "더 이상의 자세한 설명은 생략한다.",
  ),
  UserMock(
    backgroundImage: _img,
    name: "김환희",
    intro: "뭣이 중헌디",
  ),
  UserMock(
    backgroundImage: _img,
    name: "뚱이",
    intro: "아뇨, 뚱인데요?",
  ),
  UserMock(
    backgroundImage: _img,
    name: "김주원",
    intro: "이게 최선입니까 확실해요?",
  ),
];
