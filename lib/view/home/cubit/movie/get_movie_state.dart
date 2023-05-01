part of 'get_movie_cubit.dart';

@freezed
class GetMovieState with _$GetMovieState {
  const factory GetMovieState.initial() = _Initial;
  const factory GetMovieState.loading() = _Loading;
  const factory GetMovieState.loaded(MoviesResponse response) = _Loaded;
  const factory GetMovieState.error(String message) = _Error;
}
