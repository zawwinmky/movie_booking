import 'package:json_annotation/json_annotation.dart';

part 'genres_vo.g.dart';

@JsonSerializable()
class GenresVO {
  int? id;
  String? name;
  GenresVO(this.id, this.name);

  factory GenresVO.fromJson(Map<String, dynamic> json) =>
      _$GenresVOFromJson(json);

  Map<String, dynamic> toJson() => _$GenresVOToJson(this);
}
