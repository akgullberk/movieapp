import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/home/presentation/bloc/trendings_state.dart';
import 'package:movieapp/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:movieapp/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async{
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold(
      (error){
        emit(
          FailureLoadTrendingMovies(errorMessage: error)
        );
      },
      (data){
        emit(
          TrendingMoviesLoaded(movies : data)
        );
      }
    );
  }
}