import 'package:about_weather/today_history/model/res_body.dart';
import 'package:json_annotation/json_annotation.dart';

part 'today_history.g.dart';

@JsonSerializable(nullable: false)
class TodayHistory {
  @JsonKey(name: "showapi_res_code")
  int resCode;
  @JsonKey(name: "showapi_res_error")
  String resError;
  @JsonKey(name: "showapi_res_body")
  ResBody resBody;

  TodayHistory({this.resCode, this.resError, this.resBody});

  factory TodayHistory.fromJson(Map<String, dynamic> json) => _$TodayHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TodayHistoryToJson(this);
}
