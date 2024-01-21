import '../../model/profile.dart';
import '../chat_dto/chatting_list_page_dto.dart';

class MainDTO {
  int? userId;
  Profile? userProfile;
  List<FriendsDTO>? friendList;
  List<FriendsDTO>? birthdayFriendList;
  int? birthdayCount;
  List<ChatroomDTO>? favorites;

  MainDTO(
      {this.userId,
      this.userProfile,
      this.friendList,
      this.birthdayFriendList,
      this.birthdayCount,
      this.favorites});

  MainDTO.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        userProfile = Profile.fromJson(json["userProfile"]),
        friendList = (json["friendList"] as List)
            .map((e) => FriendsDTO.fromJson(e))
            .toList(),
        birthdayFriendList = (json["birthdayFriendList"] as List)
            .map((e) => FriendsDTO.fromJson(e))
            .toList(),
        birthdayCount = json["birthdayCount"];
}

class FriendsDTO {
  int? userId;
  String? nickname;
  String? birthdate;
  String? profileImage;
  String? backImage;
  String? statusMessage;
  String? phoneNum;
  bool? isBirthday;
  bool? isFavorite;

  FriendsDTO(
      {this.userId,
      this.nickname,
      this.birthdate,
      this.profileImage,
      this.backImage,
      this.statusMessage,
      this.phoneNum,
      this.isBirthday,
      this.isFavorite});

  FriendsDTO.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        nickname = json["nickname"],
        birthdate = json["birthdate"],
        profileImage = json["profileImage"],
        backImage = json["backImage"],
        statusMessage = json["statusMessage"],
        phoneNum = json["phoneNum"],
        isBirthday = json["isBirthday"] == "오늘 생일 친구",
        isFavorite = json["favorite"] {
    print('fromJson: $json');
  }
}
