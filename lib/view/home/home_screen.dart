import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ftoast/ftoast.dart';
import 'package:video_vntny/constants/app_texts.dart';
import 'package:video_vntny/view/home/cubit/movie/get_movie_cubit.dart';
import 'package:video_vntny/view/home/widget/movie_card.dart';
import 'package:video_vntny/view/home/widget/search_widget.dart';
import 'package:video_vntny/view/play_video/play_video_screen.dart';
import 'package:video_vntny/view/play_video/video_argument.dart';
import 'package:video_vntny/widget/empty_widget.dart';
import 'package:video_vntny/widget/error_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GetMovieCubit _movieCubit;
  final _searchController = TextEditingController();

  @override
  void initState() {
    _movieCubit = BlocProvider.of<GetMovieCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SearchWidget(
            search: () => _movieCubit.request(_searchController.text),
            hint: AppTexts.findMovie,
            textController: _searchController,
          ),
        ),
      ),
      body: BlocBuilder<GetMovieCubit, GetMovieState>(
        builder: (context, state) => state.when(
          initial: () => const EmptyWidget(
            emptyDescription: AppTexts.emptyHomeDescription,
            emptyInstruction: AppTexts.emptyHomeInstruction,
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loaded: (response) => ListView.builder(
            itemCount: response.results.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = response.results[index];
              return GestureDetector(
                onTap: () {
                  if (movie.previewUrl != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayVideoScreen(
                          arguments: VideoArguments(movie, response.results),
                        ),
                      ),
                    );
                  } else {
                    FToast.toast(
                      context,
                      msg: AppTexts.videoUrlIsNotAvaliable,
                    );
                  }
                },
                child: MovieCard(movie: movie, size: size),
              );
            },
          ),
          error: (message) => ErrorScreenWidget(
            errorMessage: message,
            errorInstruction: AppTexts.emptyHomeInstruction,
          ),
        ),
      ),
    );
  }
}
