import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  int cityId;
  String counname;
  String ianatimezone;
  String name;
  String pname;
  String secondaryname;
  String timezone;

  City({
    required this.cityId,
    required this.counname,
    required this.ianatimezone,
    required this.name,
    required this.pname,
    required this.secondaryname,
    required this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
