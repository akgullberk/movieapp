import 'package:dartz/dartz.dart';
import 'package:movieapp/common/helper/mapper/movie_mapper.dart';
import 'package:movieapp/features/movie/data/datasources/movie.dart';
import 'package:movieapp/features/movie/data/models/movie.dart';
import 'package:movieapp/features/movie/domain/repositories/movie.dart';
import 'package:movieapp/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository{
  @override
  Future<Either> getTrendingMovies() async{
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error){
        return Left(error);
      },
      (data){
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
  
  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error){
        return Left(error);
      },
      (data){
        var movies = List.from(data['content']).map((item) => MovieMapper.toEntity(MovieModel.fromJson(item))).toList();
        return Right(movies);
      }
    );
  }
}