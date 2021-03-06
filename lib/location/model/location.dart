import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? callbackTime;
  String? locationTime;
  int? locationType;
  String? latitude;
  String? longitude;
  double? accuracy;
  double? altitude;
  double? bearing;
  double? speed;
  String? country;
  String? province;
  String? city;
  String? district;
  String? street;
  String? streetNumber;
  String? cityCode;
  String? adCode;
  String? address;
  String? description;
  int? errorCode;
  String? errorInfo;

  Location({
    this.callbackTime,
    this.locationTime,
    this.locationType,
    this.latitude,
    this.longitude,
    this.accuracy,
    this.altitude,
    this.bearing,
    this.speed,
    this.country,
    this.province,
    this.city,
    this.district,
    this.street,
    this.streetNumber,
    this.cityCode,
    this.adCode,
    this.address,
    this.description,
    this.errorCode,
    this.errorInfo,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @override
  String toString() {
    return super.toString();
  }
}
