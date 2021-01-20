class Location {
  String callbackTime;
  String locationTime;
  int locationType;
  double latitude;
  double longitude;
  double accuracy;
  double altitude;
  double bearing;
  double speed;
  String country;
  String province;
  String city;
  String district;
  String street;
  String streetNumber;
  String cityCode;
  String adCode;
  String address;
  String description;

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
  });

  Location.fromJson(Map<String, dynamic> json) {
    callbackTime = json['callbackTime'];
    locationTime = json['locationTime'];
    locationType = json['locationType'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    accuracy = json['accuracy'];
    altitude = json['altitude'];
    bearing = json['bearing'];
    speed = json['speed'];
    country = json['country'];
    province = json['province'];
    city = json['city'];
    district = json['district'];
    street = json['street'];
    streetNumber = json['streetNumber'];
    cityCode = json['cityCode'];
    adCode = json['adCode'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['callbackTime'] = this.callbackTime;
    data['locationTime'] = this.locationTime;
    data['locationType'] = this.locationType;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['accuracy'] = this.accuracy;
    data['altitude'] = this.altitude;
    data['bearing'] = this.bearing;
    data['speed'] = this.speed;
    data['country'] = this.country;
    data['province'] = this.province;
    data['city'] = this.city;
    data['district'] = this.district;
    data['street'] = this.street;
    data['streetNumber'] = this.streetNumber;
    data['cityCode'] = this.cityCode;
    data['adCode'] = this.adCode;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}
