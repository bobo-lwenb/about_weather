import 'package:json_annotation/json_annotation.dart';

part 'limit.g.dart';

@JsonSerializable()
class Limit {
  String date;
  String prompt;

  Limit({
    required this.date,
    required this.prompt,
  });

  factory Limit.fromJson(Map<String, dynamic> json) => _$LimitFromJson(json);

  Map<String, dynamic> toJson() => _$LimitToJson(this);
}
