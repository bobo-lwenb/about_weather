import 'package:json_annotation/json_annotation.dart';

import 'china_add.dart';
import 'china_total.dart';
import 'show_add_switch.dart';
import 'tree/area.dart';

part 'internal_data.g.dart';

@JsonSerializable()
class InternalData {
  String lastUpdateTime;
  ChinaTotal chinaTotal;
  ChinaAdd chinaAdd;
  bool isShowAdd;
  ShowAddSwitch showAddSwitch;
  List<Area> areaTree;

  InternalData({
    required this.lastUpdateTime,
    required this.chinaTotal,
    required this.chinaAdd,
    required this.isShowAdd,
    required this.showAddSwitch,
    required this.areaTree,
  });

  factory InternalData.fromJson(Map<String, dynamic> json) =>
      _$InternalDataFromJson(json);

  Map<String, dynamic> toJson() => _$InternalDataToJson(this);
}
