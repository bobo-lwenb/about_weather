import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  String? title;
  String? year;
  String? month;
  String? day;
  String? content;

  Result({this.title, this.year, this.month, this.day, this.content});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
