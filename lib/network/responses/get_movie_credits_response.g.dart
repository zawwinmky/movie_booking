// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_credits_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieCreditResponse _$GetMovieCreditResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieCreditResponse(
      json['id'] as int?,
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['crew'] as List<dynamic>?)
          ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMovieCreditResponseToJson(
        GetMovieCreditResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
