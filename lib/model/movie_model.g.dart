// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieModel _$$_MovieModelFromJson(Map<String, dynamic> json) =>
    _$_MovieModel(
      wrapperType: json['wrapperType'] as String,
      kind: json['kind'] as String,
      artistId: json['artistId'] as int,
      collectionId: json['collectionId'] as int?,
      trackId: json['trackId'] as int,
      artistName: json['artistName'] as String,
      trackName: json['trackName'] as String,
      collectionName: json['collectionName'] as String?,
      trackCensoredName: json['trackCensoredName'] as String,
      artistViewUrl: json['artistViewUrl'] as String,
      artworkUrl100: json['artworkUrl100'] as String?,
      previewUrl: json['previewUrl'] as String?,
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      country: json['country'] as String,
      primaryGenreName: json['primaryGenreName'] as String,
    );

Map<String, dynamic> _$$_MovieModelToJson(_$_MovieModel instance) =>
    <String, dynamic>{
      'wrapperType': instance.wrapperType,
      'kind': instance.kind,
      'artistId': instance.artistId,
      'collectionId': instance.collectionId,
      'trackId': instance.trackId,
      'artistName': instance.artistName,
      'trackName': instance.trackName,
      'collectionName': instance.collectionName,
      'trackCensoredName': instance.trackCensoredName,
      'artistViewUrl': instance.artistViewUrl,
      'artworkUrl100': instance.artworkUrl100,
      'previewUrl': instance.previewUrl,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'country': instance.country,
      'primaryGenreName': instance.primaryGenreName,
    };
