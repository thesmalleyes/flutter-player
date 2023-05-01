import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_vntny/data/repository/movie_repository.dart';
import 'package:video_vntny/model/movies_response.dart';

part 'get_movie_state.dart';
part 'get_movie_cubit.freezed.dart';

class GetMovieCubit extends Cubit<GetMovieState> {
  final MovieRepository repository;
  GetMovieCubit(this.repository) : super(const GetMovieState.initial());

  request(String keyword) async {
    emit(const GetMovieState.loading());
    try {
      final result = await repository.getMovies(keyword: keyword);
      emit(GetMovieState.loaded(result));
    } catch (e) {
      emit(GetMovieState.error(e.toString()));
    }
  }
}
