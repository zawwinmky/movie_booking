import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking/data/VOs/date_vo.dart';

import '../../data/VOs/movie_vo.dart';

part 'movie_list_response.g.part';

@JsonSerializable()
class GetNowPlayingMovieList {
  @JsonKey(name: "dates")
  List<DateVO>? dates;

  @JsonKey(name: "page")
  int? page;

  @JsonKey(name: "results")
  List<MovieVO>? results;

  GetNowPlayingMovieList(this.dates, this.page, this.results);

  factory GetNowPlayingMovieList.fromJson(Map<String, dynamic> json) =>
      _$GetNowPlayingMovieListFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingMovieListToJson(this);
}
