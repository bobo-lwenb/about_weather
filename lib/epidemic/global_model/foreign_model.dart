import 'package:about_weather/epidemic/global_model/foreign_area.dart';
import 'package:json_annotation/json_annotation.dart';

part 'foreign_model.g.dart';

@JsonSerializable(nullable: true)
class ForeignModel {
  String name;
  String continent;
  String y;
  String date;
  bool isUpdated;
  int confirmAdd;
  int confirmAddCut;
  int confirm;
  int suspect;
  int dead;
  int heal;
  int nowConfirm;
  int confirmCompare;
  int nowConfirmCompare;
  int healCompare;
  int deadCompare;
  List<ForeignArea> children;

  ForeignModel({
    this.name,
    this.continent,
    this.y,
    this.date,
    this.isUpdated,
    this.confirmAdd,
    this.confirmAddCut,
    this.confirm,
    this.suspect,
    this.dead,
    this.heal,
    this.nowConfirm,
    this.confirmCompare,
    this.nowConfirmCompare,
    this.healCompare,
    this.deadCompare,
    this.children,
  });

  factory ForeignModel.fromJson(Map<String, dynamic> json) =>
      _$ForeignModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForeignModelToJson(this);
}
