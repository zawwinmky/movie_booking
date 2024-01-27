import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_booking/network/api_constants.dart';

class DioDataAgentImpl {
  void getNowPlayingMovieList(int page) {
    Map<String, String> queryParameters = {
      kApiKeyParam: kApiKeyValue,
      kLanguageParam: kLanguageValue,
      kPageParam: page.toString(),
    };
    Dio()
        .get("$kDioBaseUrl$kGetNowPlayingEndPoint",
            queryParameters: queryParameters)
        .then((value) {
      debugPrint("Dio data fetch SUCCESS ===> ${value.toString()}");
    }).catchError((error) {
      debugPrint("Error thrown ====> ${error.toString()}");
    });
  }
}
