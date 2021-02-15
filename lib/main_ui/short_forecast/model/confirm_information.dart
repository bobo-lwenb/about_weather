import 'package:json_annotation/json_annotation.dart';

part 'confirm_information.g.dart';

@JsonSerializable(nullable: true)
class ConfirmInfo {
  int comfirmIcon;
  String comfirmIconDesc;
  int isConfirm;

  ConfirmInfo({
    this.comfirmIcon,
    this.comfirmIconDesc,
    this.isConfirm,
  });

  factory ConfirmInfo.fromJson(Map<String, dynamic> json) =>
      _$ConfirmInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmInfoToJson(this);
}
