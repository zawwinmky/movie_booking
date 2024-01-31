import 'package:json_annotation/json_annotation.dart';

part 'date_vo.g.part';

@JsonSerializable()
class DateVO {
  @JsonKey(name: "maximum")
  String? maximum;

  @JsonKey(name: "maximum")
  String? minimum;

  DateVO(this.maximum, this.minimum);

  factory DateVO.fromJson(Map<String, dynamic> json) => _$DateVOFromJson(json);

  Map<String, dynamic> toJson() => _$DateVOToJson(this);
}
