class NavigationItem {
  final int id;
  final String label;
  final String icon;
  final String imgUrl;

  NavigationItem(
      {required this.id,
        required this.label,
        required this.icon,
        required this.imgUrl});
}

List<NavigationItem> navigationItem = [
  NavigationItem(
      id: 0,
      label: "친구",
      icon: "assets/icons/friend_icon.svg",
      imgUrl: "assets/icons/friend_icon_active.svg"),
  NavigationItem(
      id: 1,
      label: "채팅",
      icon: "assets/icons/chat_icon.svg",
      imgUrl: "assets/icons/chat_icon_active.svg"),
  NavigationItem(
      id: 2,
      label: "오픈채팅",
      icon: "assets/icons/multi_chat_icon.svg",
      imgUrl: "assets/icons/multi_chat_icon_active.svg"),
  NavigationItem(
      id: 3,
      label: "내 정보",
      icon: "assets/icons/info_icon.svg",
      imgUrl: "assets/icons/info_icon_active.svg"),
];
