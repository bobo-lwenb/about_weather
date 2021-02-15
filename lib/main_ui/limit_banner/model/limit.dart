import 'package:json_annotation/json_annotation.dart';

part 'limit.g.dart';

@JsonSerializable(nullable: true)
class Limit {
  String date;
  String prompt;

  Limit({
    this.date,
    this.prompt,
  });

  factory Limit.fromJson(Map<String, dynamic> json) => _$LimitFromJson(json);

  Map<String, dynamic> toJson() => _$LimitToJson(this);
}
