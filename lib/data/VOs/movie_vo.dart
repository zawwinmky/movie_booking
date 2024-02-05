import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking/data/VOs/production_company_vo.dart';
import 'package:movie_booking/data/VOs/production_country_vo.dart';
import 'package:movie_booking/data/VOs/spoken_languages_vo.dart';
import 'package:movie_booking/network/api_constants.dart';

import 'collection_vo.dart';
import 'genres_vo.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "backdrop_path")
  String? backdropPath;

  @JsonKey(name: "belongs_to_collection")
  List<CollectionVO>? collection;

  @JsonKey(name: "budget")
  double? budget;

  @JsonKey(name: "genres")
  List<GenresVO>? genres;

  @JsonKey(name: "homepage")
  String? homepage;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "original_language")
  String? originalLanguage;

  @JsonKey(name: "original_title")
  String? originalTitle;

  @JsonKey(name: "overview")
  String? overview;

  @JsonKey(name: "popularity")
  double? popularity;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "production_companies")
  List<ProductionCompanyVO>? productionCompanies;

  @JsonKey(name: "production_countries")
  List<ProductionCountryVO>? productionCountries;

  @JsonKey(name: "release_date")
  String? releaseDate;

  @JsonKey(name: "revenue")
  double? revenue;

  @JsonKey(name: "runtime")
  int? runtime;

  @JsonKey(name: "spoken_languages")
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "tagline")
  String? tagline;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "video")
  bool? video;

  @JsonKey(name: "vote_average")
  double? voteAverage;

  @JsonKey(name: "vote_count")
  int? voteCount;

  MovieVO(
      this.adult,
      this.backdropPath,
      this.collection,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCompanies,
      this.productionCountries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLanguages,
      this.status,
      this.tagline,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  ///Poster path with base url
  String getPosterPathWithBaseUrl() {
    return kImageBaseUrl + (posterPath ?? "");
  }

  ///Backdrop path with base url
  String getBackdropPathWithBaseUrl() {
    return kImageBaseUrl + (backdropPath ?? "");
  }

  ///Get rating with 2 deci

  String getRatingWithTwoDeci() {
    return voteAverage?.toStringAsFixed(2) ?? "";
  }

  ///Get Run Time format
  String getRunTimeFormat() {
    if (runtime != null) {
      int hours = runtime! ~/ 60;
      int minutes = runtime! % 60;
      return "$hours hr $minutes mins";
    } else {
      return "";
    }
  }

  ///Get Release Date Format
  String getReleaseDate() {
    if (releaseDate != null) {
      DateTime dateTime = DateTime.parse(releaseDate!);
      String formattedDate = DateFormat('dd MMMM').format(dateTime);
      return formattedDate;
    } else {
      return "";
    }
  }
}
