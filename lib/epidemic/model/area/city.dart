import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(nullable: true)
class City {
  int totalCured;
  int totalDeath;
  int totalIncrease;
  String childStatistic;
  int totalDoubtful;
  int totalConfirmed;

  City(
      {this.totalCured,
      this.totalDeath,
      this.totalIncrease,
      this.childStatistic,
      this.totalDoubtful,
      this.totalConfirmed});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
