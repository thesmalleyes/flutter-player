import 'package:video_vntny/model/movie_model.dart';

class VideoArguments {
  final MovieModel selectedMovie;
  final List<MovieModel> otherMovies;

  VideoArguments(this.selectedMovie, this.otherMovies);
}
