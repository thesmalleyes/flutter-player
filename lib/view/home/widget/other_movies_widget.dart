import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:video_vntny/constants/app_colors.dart';
import 'package:video_vntny/constants/app_texts.dart';
import 'package:video_vntny/model/movie_model.dart';
import 'package:video_vntny/util/datetime_extension.dart';

class OtherMovies extends StatelessWidget {
  final List<MovieModel> movies;
  const OtherMovies({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () {
            if (movie.previewUrl != null) {
            } else {
              FToast.toast(
                context,
                msg: AppTexts.videoUrlIsNotAvaliable,
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 4, left: 16, right: 16),
            padding: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(.3)),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16) +
                            const EdgeInsets.only(top: 8, bottom: 4),
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
                ),
                Text(Duration(milliseconds: movie.trackTimeMillis)
                    .toString()
                    .substring(2, 7))
              ],
            ),
          ),
        );
      },
    );
  }
}
