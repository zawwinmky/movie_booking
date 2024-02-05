import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking/network/api_constants.dart';
import 'package:movie_booking/network/responses/get_movie_credits_response.dart';
import 'package:movie_booking/network/responses/movie_list_response.dart';
import 'package:retrofit/http.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(kGetNowPlayingEndPoint)
  Future<MovieListResponse?> getNowPlayingMovieList(
    @Query(kApiKeyParam) String apiKey,
    @Query(kLanguageParam) String language,
    @Query(kPageParam) String page,
  );

  @GET(kGetComingSoonEndPoint)
  Future<MovieListResponse?> getComingSoonMovieList(
    @Query(kApiKeyParam) String apiKey,
    @Query(kLanguageParam) String language,
    @Query(kPageParam) String page,
  );

  @GET("$kGetMovieDetailsEndPoint/{movie_id}")
  Future<MovieVO> getMovieDetails(
    @Path("movie_id") String movieID,
    @Query(kApiKeyParam) String apiKey,
    @Query(kLanguageParam) String language,
  );

  @GET("$kGetMovieCreditEndPoint/{movie_id}/credits")
  Future<GetMovieCreditResponse?> getMovieCredits(
    @Path("movie_id") String movieID,
    @Query(kApiKeyParam) String apiKey,
    @Query(kLanguageParam) String language,
  );
}
