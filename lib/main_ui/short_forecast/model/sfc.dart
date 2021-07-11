import 'package:about_weather/main_ui/short_forecast/model/confirm_information.dart';
import 'package:about_weather/main_ui/short_forecast/model/percent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sfc.g.dart';

@JsonSerializable()
class SFC {
  String banner;
  ConfirmInfo confirmInfo;
  int isCorrect;
  int isFeedback;
  String notice;
  List<Percent> percent;
  int rain;
  int rainLastTime;
  int sfCondition;
  int timestamp;

  SFC({
    required this.banner,
    required this.confirmInfo,
    required this.isCorrect,
    required this.isFeedback,
    required this.notice,
    required this.percent,
    required this.rain,
    required this.rainLastTime,
    required this.sfCondition,
    required this.timestamp,
  });

  factory SFC.fromJson(Map<String, dynamic> json) => _$SFCFromJson(json);

  Map<String, dynamic> toJson() => _$SFCToJson(this);
}
