import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/movie/domain/repositories/movie.dart';
import 'package:movieapp/service_locator.dart';

class GetSimilarMoviesUseCase extends Usecase<Either, int> {

  @override
  Future<Either> call({int ? params}) async {
    return await sl<MovieRepository>().getSimilarMovies(params!);
  }
}