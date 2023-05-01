import 'package:video_vntny/model/movies_response.dart';

abstract class MovieRepository {
  Future<MoviesResponse> getMovies(
      {String keyword = '', String entity = 'musicVideo'});
}
