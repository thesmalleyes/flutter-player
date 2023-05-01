import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_vntny/constants/app_colors.dart';
import 'package:video_vntny/data/implementation/movie_repository_impl.dart';
import 'package:video_vntny/view/home/cubit/movie/get_movie_cubit.dart';
import 'package:video_vntny/view/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Playlist',
      theme: ThemeData(
        primarySwatch: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => GetMovieCubit(MovieRepositoryImpl()),
        child: const HomeScreen(),
      ),
    );
  }
}
