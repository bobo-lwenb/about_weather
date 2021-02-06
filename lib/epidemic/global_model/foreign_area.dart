import 'package:json_annotation/json_annotation.dart';

part 'foreign_area.g.dart';

@JsonSerializable(nullable: true)
class ForeignArea {
  String name;
  String date;
  String nameMap;
  bool isUpdated;
  int confirmAdd;
  int confirmAddCut;
  int confirm;
  int suspect;
  int dead;
  int heal;

  ForeignArea({
    this.name,
    this.date,
    this.nameMap,
    this.isUpdated,
    this.confirmAdd,
    this.confirmAddCut,
    this.confirm,
    this.suspect,
    this.dead,
    this.heal,
  });

  factory ForeignArea.fromJson(Map<String, dynamic> json) =>
      _$ForeignAreaFromJson(json);

  Map<String, dynamic> toJson() => _$ForeignAreaToJson(this);
}
