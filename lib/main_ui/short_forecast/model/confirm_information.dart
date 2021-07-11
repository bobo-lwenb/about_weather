import 'package:json_annotation/json_annotation.dart';

part 'confirm_information.g.dart';

@JsonSerializable()
class ConfirmInfo {
  int comfirmIcon;
  String comfirmIconDesc;
  int isConfirm;

  ConfirmInfo({
    required this.comfirmIcon,
    required this.comfirmIconDesc,
    required this.isConfirm,
  });

  factory ConfirmInfo.fromJson(Map<String, dynamic> json) =>
      _$ConfirmInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmInfoToJson(this);
}
