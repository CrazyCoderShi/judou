import 'package:intl/intl.dart';

class DateUtils {
  static String fromNow(int timeStamp) {
    /// 因为dart里面并没有实现时区的设置，只能手动设置了
    DateTime time =
        DateTime.fromMillisecondsSinceEpoch((timeStamp + 8 * 3600) * 1000);
    return DateFormat('yyyy/MM/dd HH:mm').format(time);
  }

  static String replaceLineWithDot(String date) {
    return date.replaceAll(RegExp(r'-'), '.');
  }
}
