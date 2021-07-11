import 'package:about_weather/epidemic/global_model/foreign_model.dart';
import 'package:about_weather/epidemic/global_model/global_statis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'global_sources.g.dart';

@JsonSerializable()
class GlobalSources {
  List<ForeignModel> foreignList;
  GlobalStatis globalStatis;

  GlobalSources({
    required this.foreignList,
    required this.globalStatis,
  });

  factory GlobalSources.fromJson(Map<String, dynamic> json) =>
      _$GlobalSourcesFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalSourcesToJson(this);
}
