import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/movie/domain/repositories/movie.dart';
import 'package:movieapp/service_locator.dart';

class SearchMovieUseCase extends Usecase<Either,String> {
  
  @override
  Future<Either> call({String ? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
  
}