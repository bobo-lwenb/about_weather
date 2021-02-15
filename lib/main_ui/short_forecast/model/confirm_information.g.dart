// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmInfo _$ConfirmInfoFromJson(Map<String, dynamic> json) {
  return ConfirmInfo(
    comfirmIcon: json['comfirmIcon'] as int,
    comfirmIconDesc: json['comfirmIconDesc'] as String,
    isConfirm: json['isConfirm'] as int,
  );
}

Map<String, dynamic> _$ConfirmInfoToJson(ConfirmInfo instance) =>
    <String, dynamic>{
      'comfirmIcon': instance.comfirmIcon,
      'comfirmIconDesc': instance.comfirmIconDesc,
      'isConfirm': instance.isConfirm,
    };
