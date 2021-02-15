import 'package:about_weather/main_ui/live_index/model/live_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_list.g.dart';

@JsonSerializable(nullable: true)
class LiveList {
  List<LiveIndex> list;

  LiveList({this.list});

  factory LiveList.fromJson(Map<String, dynamic> json) =>
      _$LiveListFromJson(json);

  Map<String, dynamic> toJson() => _$LiveListToJson(this);
}
