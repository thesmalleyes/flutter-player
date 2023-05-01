import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:video_vntny/data/repository/movie_repository.dart';
import 'package:video_vntny/model/movies_response.dart';

class MovieRepositoryImpl implements MovieRepository {
  final dio = Dio();
  @override
  Future<MoviesResponse> getMovies(
      {String keyword = '', String entity = 'musicVideo'}) async {
    try {
      var params = {'term': keyword, 'entity': entity};
      final response = await dio.get('https://itunes.apple.com/search',
          queryParameters: params);
      log(response.data.toString());
      return MoviesResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      throw e.toString();
    }
  }
}
