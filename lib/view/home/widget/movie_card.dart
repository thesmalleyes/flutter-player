import 'package:flutter/material.dart';
import 'package:video_vntny/constants/app_texts.dart';
import 'package:video_vntny/model/movie_model.dart';
import 'package:video_vntny/util/datetime_extension.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final Size size;
  const MovieCard({super.key, required this.movie, required this.size});

  @override
  Widget build(BuildContext context) {
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
          )
        ],
      ),
    );
  }
}
