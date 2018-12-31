import 'package:intl/intl.dart';

class DateUtils {
  static String fromNow(int timeStamp) {
    /// 因为dart里面并没有实现时区的设置，只能手动设置了

    int now = DateTime.now().millisecondsSinceEpoch + 8 * 3600000;
    double distance = (now - timeStamp) / 60000;
    // 大于24小时就直接显示日期
    if (distance > 24 * 60) {
      DateTime time =
          DateTime.fromMillisecondsSinceEpoch((timeStamp + 8 * 3600) * 1000);
      return DateFormat('yyyy/MM/dd HH:mm').format(time);
    }

    if (distance > 60 && distance < 24 * 60) {
      return '${(distance / 60).toStringAsFixed(0)}小时前';
    }

    if (distance < 60 && distance > 1) {
      return '${distance.toStringAsFixed(0)}分钟前';
    } else {
      DateTime time =
          DateTime.fromMillisecondsSinceEpoch((timeStamp + 8 * 3600) * 1000);
      return DateFormat('yyyy/MM/dd HH:mm').format(time);
    }
  }

  static String replaceLineWithDot(String date) {
    return date.replaceAll(RegExp(r'-'), '.');
  }
}
