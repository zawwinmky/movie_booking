// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:movie_booking/network/api_constants.dart';
// import 'package:movie_booking/network/data_agent/movie_booking_data_agent.dart';
//
// class HttpDataAgentImpl extends MovieBookingDataAgent {
//   @override
//   void getNowPlayingMovieList(int page) {
//     Map<String, String> queryParameters = {
//       kApiKeyParam: kApiKeyValue,
//       kLanguageParam: kLanguageValue,
//     };
//
//     var url = Uri.https(kHttpBaseUrl, kGetNowPlayingEndPoint, queryParameters);
//
//     http.get(url).then((response) {
//       debugPrint("Http response success ======>   ${response.body.toString()}");
//     }).catchError((error) {
//       debugPrint("Http error thrown ======> ${error.toString()}");
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
