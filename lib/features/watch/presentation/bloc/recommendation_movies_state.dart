import 'package:movieapp/features/movie/domain/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;

  RecommendationMoviesLoaded({required this.movies});
}

class FailuerLoadRecommendationMovies extends RecommendationMoviesState {
  final String errorMessage;
  FailuerLoadRecommendationMovies({required this.errorMessage});
}
