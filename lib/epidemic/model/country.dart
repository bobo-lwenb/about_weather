import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(nullable: true)
class Country {
  int totalCured;
  int totalDeath;
  int totalIncrease;
  int incDoubtful;
  String childStatistic;
  int totalDoubtful;
  String time;
  int totalConfirmed;

  Country(
      {this.totalCured,
      this.totalDeath,
      this.totalIncrease,
      this.incDoubtful,
      this.childStatistic,
      this.totalConfirmed,
      this.time,
      this.totalDoubtful});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
