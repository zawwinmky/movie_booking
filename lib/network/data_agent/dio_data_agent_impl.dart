// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:movie_booking/network/api_constants.dart';
// import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';
//
// class DioDataAgentImpl extends MovieBookingDataAgent {
//   @override
//   void getNowPlayingMovieList(int page) {
//     Map<String, String> queryParameters = {
//       kApiKeyParam: kApiKeyValue,
//       kLanguageParam: kLanguageValue,
//       kPageParam: page.toString(),
//     };
//     Dio()
//         .get("$kDioBaseUrl$kGetNowPlayingEndPoint",
//             queryParameters: queryParameters)
//         .then((value) {
//       debugPrint("Dio data fetch SUCCESS ===> ${value.toString()}");
//     }).catchError((error) {
//       debugPrint("Error thrown ====> ${error.toString()}");
//     });
//   }
//
//   @override
//   void getComingSoonMovieList(int page) {
//     // TODO: implement getComingSoonMovieList
//   }
//
//   @override
//   void getMovieCredits() {
//     // TODO: implement getMovieCredits
//   }
//
//   @override
//   void getMovieDetails() {
//     // TODO: implement getMovieDetails
//   }
// }
