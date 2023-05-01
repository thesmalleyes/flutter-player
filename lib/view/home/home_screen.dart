import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_vntny/constants/app_texts.dart';
import 'package:video_vntny/util/datetime_extension.dart';
import 'package:video_vntny/view/home/cubit/movie/get_movie_cubit.dart';
import 'package:video_vntny/view/home/widget/search_widget.dart';
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
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.width / 3,
                      child: movie.artworkUrl100 != null
                          ? Image.network(
                              movie.artworkUrl100!,
                              width: size.width,
                              fit: BoxFit.cover,
                            )
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.error),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(AppTexts.noPreviewAvailable)
                              ],
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16) +
                          const EdgeInsets.only(top: 8),
                      child: Text(
                        movie.trackName,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '${movie.artistName} • ${movie.releaseDate.timeAgo()}',
                      ),
                    ),
                  ],
                ),
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
