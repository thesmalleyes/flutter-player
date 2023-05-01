import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_vntny/model/movie_model.dart';

part 'movies_response.freezed.dart';
part 'movies_response.g.dart';

@freezed
class MoviesResponse with _$MoviesResponse {
  const factory MoviesResponse({
    required int resultCount,
    required List<MovieModel> results,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}
