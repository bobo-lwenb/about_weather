import 'package:about_weather/today_history/model/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'res_body.g.dart';

@JsonSerializable(nullable: false)
class ResBody {
  @JsonKey(name: "ret_code")
  int retCode;
  @JsonKey(name: "list")
  List<Event> events;

  ResBody({this.retCode, this.events});

  factory ResBody.fromJson(Map<String, dynamic> json) => _$ResBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ResBodyToJson(this);
}
