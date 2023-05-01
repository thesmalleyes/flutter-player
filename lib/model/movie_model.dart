import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required String wrapperType,
    required String kind,
    required int artistId,
    int? collectionId,
    required int trackId,
    required String artistName,
    required String trackName,
    String? collectionName,
    required String trackCensoredName,
    required String artistViewUrl,
    String? artworkUrl100,
    String? previewUrl,
    required DateTime releaseDate,
    required String country,
    required String primaryGenreName,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}
