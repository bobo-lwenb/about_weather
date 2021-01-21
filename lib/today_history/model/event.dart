import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(nullable: false)
class Event {
  String title;
  String img;
  String year;
  int month;
  int day;

  Event({this.title, this.img, this.year, this.month, this.day});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
