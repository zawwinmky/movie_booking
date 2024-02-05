import 'package:movie_booking/data/VOs/credit_vo.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';

abstract class MovieBookingDataAgent {
  Future<List<MovieVO>> getNowPlayingMovieList(String page);
  Future<List<MovieVO>> getComingSoonMovieList(String page);
  Future<MovieVO> getMovieDetails(String movieID);
  Future<List<CreditVO>> getMovieCredits(String movieID);
}
