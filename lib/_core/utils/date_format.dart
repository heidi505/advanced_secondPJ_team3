import 'package:intl/intl.dart';

String getCurrentDay() {
  DateTime now = DateTime.now();
  String weekday = _getWeekday(now.weekday);

  return "${now.year}년 ${now.month}월 ${now.day}일 $weekday";
}

String _getWeekday(int weekday) {
  switch (weekday) {
    case 1:
      return '월요일';
    case 2:
      return '화요일';
    case 3:
      return '수요일';
    case 4:
      return '목요일';
    case 5:
      return '금요일';
    case 6:
      return '토요일';
    case 7:
      return '일요일';
    default:
      return '';
  }
}

String getOneDayAgo() {
  DateTime now = DateTime.now();
  DateTime oneDayAgo = now.subtract(Duration(days: 1));
  return "${oneDayAgo.year}년 ${oneDayAgo.month}월 ${oneDayAgo.day}일 ${oneDayAgo.hour}:${oneDayAgo.minute}";
}

String getCurrentTime() {
  return DateFormat("a hh:mm")
      .format(DateTime.now())
      .replaceAll("AM", "오전")
      .replaceAll("PM", "오후");
}

String getDifferenceFromNow(int minutes) {
  DateTime currentTime = DateTime.now();
  DateTime timeAgo = currentTime.subtract(Duration(minutes: minutes));

  String differenceText = "";

  if (currentTime.difference(timeAgo).inDays > 0) {
    differenceText = "${currentTime.difference(timeAgo).inDays}일 전";
  } else if (currentTime.difference(timeAgo).inHours > 0) {
    differenceText = "${currentTime.difference(timeAgo).inHours}시간 전";
  } else if (currentTime.difference(timeAgo).inMinutes > 0) {
    differenceText = "${currentTime.difference(timeAgo).inMinutes}분 전";
  } else {
    differenceText = "방금 전";
  }

  return differenceText;
}
