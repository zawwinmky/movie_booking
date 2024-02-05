import 'package:dio/dio.dart';
import 'package:movie_booking/data/VOs/credit_vo.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';
import 'package:movie_booking/network/api_constants.dart';
import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';
import 'package:movie_booking/network/the_movie_booking_api.dart';

class RetrofitDataAgentImpl extends MovieBookingDataAgent {
  late TheMovieBookingApi mApi;

  static RetrofitDataAgentImpl? _singleton;

  factory RetrofitDataAgentImpl() {
    _singleton ??= RetrofitDataAgentImpl._internal();
    return _singleton!;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    mApi = TheMovieBookingApi(dio);
  }

  @override
  Future<List<MovieVO>> getComingSoonMovieList(String page) {
    // TODO: implement getComingSoonMovieList
    return mApi
        .getComingSoonMovieList(kApiKeyValue, kLanguageValue, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first;
  }

  @override
  Future<List<CreditVO>> getMovieCredits(String movieID) {
    // TODO: implement getMovieCredits
    return mApi
        .getMovieCredits(movieID, kApiKeyValue, kLanguageValue)
        .asStream()
        .map((response) => response?.cast ?? [])
        .first;
  }

  @override
  Future<MovieVO> getMovieDetails(String movieID) {
    // TODO: implement getMovieDetails
    return mApi.getMovieDetails(movieID, kApiKeyValue, kLanguageValue);
  }

  @override
  Future<List<MovieVO>> getNowPlayingMovieList(String page) {
    // TODO: implement getNowPlayingMovieList

    return mApi
        .getNowPlayingMovieList(kApiKeyValue, kLanguageValue, page)
        .asStream()
        .map((response) => response?.results ?? [])
        .first;
  }
}
