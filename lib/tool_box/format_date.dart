import 'package:about_weather/tool_box/fields.dart';
import 'package:intl/intl.dart';

/// params: 字符串的日期
/// return: 7:13
String formatHmm(String date) {
  if (date == null || date.isEmpty) return "";
  DateTime dateTime = DateTime.parse(date);
  DateFormat format = DateFormat("H:mm");
  return format.format(dateTime);
}

/// params: 毫秒数
/// return: 7:13
String formatDateFromSection(String second) {
  if (second == null || second.isEmpty) return "";
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(second));
  DateFormat format = DateFormat("H:mm");
  return format.format(dateTime);
}

/// params: 字符串的日期
/// return: 周一
String formatWeekday(String date) {
  if (date == null || date.isEmpty) return "";
  DateTime dateTime = DateTime.parse(date);
  int weekday = dateTime.weekday;
  return getWeekDesc(weekday);
}

/// params: 字符串的日期
/// return: 7-13
String formatMd(String date) {
  if (date == null || date.isEmpty) return "";
  DateTime dateTime = DateTime.parse(date);
  DateFormat dateFormat = DateFormat("M-dd");
  return dateFormat.format(dateTime);
}
