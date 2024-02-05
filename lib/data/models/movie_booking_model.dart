import 'package:movie_booking/data/VOs/credit_vo.dart';
import 'package:movie_booking/data/VOs/movie_vo.dart';
import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';
import 'package:movie_booking/network/data_agent/retrofit_data_agent_impl.dart';

class MovieBookingModel {
  static MovieBookingModel? _singleton;

  factory MovieBookingModel() {
    _singleton ??= MovieBookingModel._internal();
    return _singleton!;
  }

  MovieBookingModel._internal();

  ///Data Agent
  MovieBookingDataAgent mDataAgent = RetrofitDataAgentImpl();

  Future<List<MovieVO>> getNowPlayingMovieList() {
    return mDataAgent.getNowPlayingMovieList(1.toString());
  }

  Future<List<MovieVO>> getComingSoonMovieList() {
    return mDataAgent.getComingSoonMovieList(1.toString());
  }

  Future<MovieVO> getMovieDetails(String movieID) {
    return mDataAgent.getMovieDetails(movieID);
  }

  Future<List<CreditVO>> getMovieCredits(String movieID) {
    return mDataAgent.getMovieCredits(movieID);
  }
}
