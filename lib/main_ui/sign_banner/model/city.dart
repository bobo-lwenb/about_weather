import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(nullable: true)
class City {
  int cityId;
  String counname;
  String ianatimezone;
  String name;
  String pname;
  String secondaryname;
  String timezone;

  City({
    this.cityId,
    this.counname,
    this.ianatimezone,
    this.name,
    this.pname,
    this.secondaryname,
    this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
