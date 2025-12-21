import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:movieapp/features/watch/presentation/bloc/recommendation_movies_state.dart';
import 'package:movieapp/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailuerLoadRecommendationMovies(errorMessage: error));
      },
      (data) {
        emit(RecommendationMoviesLoaded(movies: data));
      },
    );
  }
}
