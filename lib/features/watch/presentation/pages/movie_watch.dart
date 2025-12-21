import 'package:flutter/material.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/watch/presentation/widgets/recommendation_movies.dart';
import 'package:movieapp/features/watch/presentation/widgets/similar_movies.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_overview.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_player.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_release_date.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_title.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoPlayer(id: movieEntity.id!),
              SizedBox(height: 16),
              VideoTitle(title: movieEntity.title!),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                  VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
                ],
              ),
              SizedBox(height: 16),
              VideoOverview(overview: movieEntity.overview!),
              SizedBox(height: 16),
              RecommendationMovies(movieId: movieEntity.id!),
              SizedBox(height: 16),
              SimilarMovies(movieId: movieEntity.id!),
            ],
          ),
        ),
      ),
    );
  }
}
