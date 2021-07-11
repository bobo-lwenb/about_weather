import 'package:json_annotation/json_annotation.dart';

part 'today.g.dart';

@JsonSerializable()
class Today {
  int? confirm;
  int? confirmCuts;
  bool? isUpdated;
  String? tip;
  @JsonKey(name: "wzz_add")
  int? wzzAdd;

  Today({
    this.confirm,
    this.confirmCuts,
    this.isUpdated,
    this.tip,
    this.wzzAdd,
  });

  factory Today.fromJson(Map<String, dynamic> json) => _$TodayFromJson(json);

  Map<String, dynamic> toJson() => _$TodayToJson(this);
}
