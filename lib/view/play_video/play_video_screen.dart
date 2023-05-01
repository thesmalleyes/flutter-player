import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:video_vntny/model/movie_model.dart';
import 'package:video_vntny/view/home/widget/other_movies_widget.dart';
import 'package:video_vntny/view/play_video/video_argument.dart';

class PlayVideoScreen extends StatefulWidget {
  final VideoArguments arguments;
  const PlayVideoScreen({super.key, required this.arguments});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  late ChewieController _chewieController;
  final otherMovies = <MovieModel>[];

  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
          widget.arguments.selectedMovie.previewUrl!),
      aspectRatio: 16 / 9,
      autoInitialize: true,
      autoPlay: true,
      // looping: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
    otherMovies.addAll(widget.arguments.otherMovies);
    otherMovies.removeWhere((movie) => movie == widget.arguments.selectedMovie);
    super.initState();
  }

  @override
  void dispose() {
    _chewieController.videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top),
                  height: size.width / 2,
                  child: Chewie(
                    controller: _chewieController,
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 16,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            OtherMovies(movies: otherMovies)
          ],
        ),
      ),
    );
  }
}
