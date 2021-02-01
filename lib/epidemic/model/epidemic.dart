import 'package:about_weather/epidemic/model/area/province.dart';
import 'package:about_weather/epidemic/model/country.dart';
import 'package:about_weather/epidemic/model/trend/trend_detailed.dart';
import 'package:about_weather/epidemic/model/update_time.dart';
import 'package:json_annotation/json_annotation.dart';

part 'epidemic.g.dart';

@JsonSerializable(nullable: true)
class Epidemic {
  Country country;
  UpdateTime dataSourceUpdateTime;
  List<TrendDetailed> trend;
  List<Province> provinceArray;

  Epidemic(
      {this.country,
      this.dataSourceUpdateTime,
      this.trend,
      this.provinceArray});

  factory Epidemic.fromJson(Map<String, dynamic> json) =>
      _$EpidemicFromJson(json);

  Map<String, dynamic> tiJson() => _$EpidemicToJson(this);
}
