import 'package:json_annotation/json_annotation.dart';

import 'today.dart';
import 'total.dart';

part 'area.g.dart';

@JsonSerializable(nullable: true)
class Area {
  String name;
  Today today;
  Total total;
  List<Area> children;

  Area({
    this.name,
    this.today,
    this.total,
    this.children,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
