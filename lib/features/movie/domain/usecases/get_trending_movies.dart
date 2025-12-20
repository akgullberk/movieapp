import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/movie/domain/repositories/movie.dart';
import 'package:movieapp/service_locator.dart';

class GetTrendingMoviesUseCase extends Usecase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}