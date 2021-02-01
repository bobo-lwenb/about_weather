import 'package:about_weather/epidemic/model/area/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable(nullable: true)
class Province {
  int totalCured;
  int totalDeath;
  int totalIncrease;
  List<City> cityArray;
  String childStatistic;
  int totalDoubtful;
  int totalConfirmed;

  Province(
      {this.totalCured,
      this.totalDeath,
      this.totalIncrease,
      this.cityArray,
      this.childStatistic,
      this.totalDoubtful,
      this.totalConfirmed});

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
