import 'package:json_annotation/json_annotation.dart';

import '../../data/VOs/credit_vo.dart';

part 'get_movie_credits_response.g.part';

@JsonSerializable()
class GetMovieCreditResponse {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "cast")
  List<CreditVO>? cast;

  @JsonKey(name: "crew")
  List<CreditVO>? crew;

  GetMovieCreditResponse(this.id, this.cast, this.crew);

  factory GetMovieCreditResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMovieCreditResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieCreditResponseToJson(this);
}
