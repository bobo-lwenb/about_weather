import 'package:json_annotation/json_annotation.dart';

part 'foreign_area.g.dart';

@JsonSerializable()
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
    required this.name,
    required this.date,
    required this.nameMap,
    required this.isUpdated,
    required this.confirmAdd,
    required this.confirmAddCut,
    required this.confirm,
    required this.suspect,
    required this.dead,
    required this.heal,
  });

  factory ForeignArea.fromJson(Map<String, dynamic> json) =>
      _$ForeignAreaFromJson(json);

  Map<String, dynamic> toJson() => _$ForeignAreaToJson(this);
}
