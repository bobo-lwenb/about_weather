import 'package:json_annotation/json_annotation.dart';

part 'trend_detailed.g.dart';

@JsonSerializable(nullable: true)
class TrendDetailed {
  String day;
  @JsonKey(name: "sure_cnt")
  int sureCnt;
  @JsonKey(name: "die_cnt")
  int dieCnt;
  @JsonKey(name: "cure_cnt")
  int cureCnt;
  @JsonKey(name: "doubt_cnt")
  int doubtCnt;
  int fullDay;

  TrendDetailed(
      {this.day,
      this.sureCnt,
      this.dieCnt,
      this.cureCnt,
      this.doubtCnt,
      this.fullDay});

  factory TrendDetailed.fromJson(Map<String, dynamic> json) =>
      _$TrendDetailedFromJson(json);

  Map<String, dynamic> toJson() => _$TrendDetailedToJson(this);
}
