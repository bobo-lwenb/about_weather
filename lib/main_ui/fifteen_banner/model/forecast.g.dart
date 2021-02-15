// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) {
  return Forecast(
    conditionDay: json['conditionDay'] as String,
    conditionIdDay: json['conditionIdDay'] as String,
    conditionNight: json['conditionNight'] as String,
    conditionIdNight: json['conditionIdNight'] as String,
    humidity: json['humidity'] as String,
    moonphase: json['moonphase'] as String,
    moonrise: json['moonrise'] as String,
    moonset: json['moonset'] as String,
    pop: json['pop'] as String,
    predictDate: json['predictDate'] as String,
    qpf: json['qpf'] as String,
    sunrise: json['sunrise'] as String,
    sunset: json['sunset'] as String,
    tempDay: json['tempDay'] as String,
    tempNight: json['tempNight'] as String,
    updatetime: json['updatetime'] as String,
    uvi: json['uvi'] as String,
    windDegreesDay: json['windDegreesDay'] as String,
    windDegreesNight: json['windDegreesNight'] as String,
    windDirDay: json['windDirDay'] as String,
    windDirNight: json['windDirNight'] as String,
    windLevelDay: json['windLevelDay'] as String,
    windLevelNight: json['windLevelNight'] as String,
    windSpeedDay: json['windSpeedDay'] as String,
    windSpeedNight: json['windSpeedNight'] as String,
  );
}

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'conditionDay': instance.conditionDay,
      'conditionIdDay': instance.conditionIdDay,
      'conditionIdNight': instance.conditionIdNight,
      'conditionNight': instance.conditionNight,
      'humidity': instance.humidity,
      'moonphase': instance.moonphase,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'pop': instance.pop,
      'predictDate': instance.predictDate,
      'qpf': instance.qpf,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'tempDay': instance.tempDay,
      'tempNight': instance.tempNight,
      'updatetime': instance.updatetime,
      'uvi': instance.uvi,
      'windDegreesDay': instance.windDegreesDay,
      'windDegreesNight': instance.windDegreesNight,
      'windDirDay': instance.windDirDay,
      'windDirNight': instance.windDirNight,
      'windLevelDay': instance.windLevelDay,
      'windLevelNight': instance.windLevelNight,
      'windSpeedDay': instance.windSpeedDay,
      'windSpeedNight': instance.windSpeedNight,
    };
