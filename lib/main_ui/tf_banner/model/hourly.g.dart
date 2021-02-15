// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return Hourly(
    condition: json['condition'] as String,
    conditionId: json['conditionId'] as String,
    date: json['date'] as String,
    hour: json['hour'] as String,
    humidity: json['humidity'] as String,
    iconDay: json['iconDay'] as String,
    iconNight: json['iconNight'] as String,
    pop: json['pop'] as String,
    pressure: json['pressure'] as String,
    qpf: json['qpf'] as String,
    realFeel: json['realFeel'] as String,
    snow: json['snow'] as String,
    temp: json['temp'] as String,
    updatetime: json['updatetime'] as String,
    uvi: json['uvi'] as String,
    windDegrees: json['windDegrees'] as String,
    windDir: json['windDir'] as String,
    windSpeed: json['windSpeed'] as String,
    windlevel: json['windlevel'] as String,
  );
}

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'condition': instance.condition,
      'conditionId': instance.conditionId,
      'date': instance.date,
      'hour': instance.hour,
      'humidity': instance.humidity,
      'iconDay': instance.iconDay,
      'iconNight': instance.iconNight,
      'pop': instance.pop,
      'pressure': instance.pressure,
      'qpf': instance.qpf,
      'realFeel': instance.realFeel,
      'snow': instance.snow,
      'temp': instance.temp,
      'updatetime': instance.updatetime,
      'uvi': instance.uvi,
      'windDegrees': instance.windDegrees,
      'windDir': instance.windDir,
      'windSpeed': instance.windSpeed,
      'windlevel': instance.windlevel,
    };
