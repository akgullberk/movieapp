import 'package:get_it/get_it.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/features/auth/data/datasources/auth_api_service.dart';
import 'package:movieapp/features/auth/data/repositories/auth.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/features/auth/domain/usecases/is_logged_in.dart';
import 'package:movieapp/features/auth/domain/usecases/signin.dart';
import 'package:movieapp/features/auth/domain/usecases/signup.dart';
import 'package:movieapp/features/movie/data/datasources/movie.dart';
import 'package:movieapp/features/movie/data/repositories/movie.dart';
import 'package:movieapp/features/movie/domain/repositories/movie.dart';
import 'package:movieapp/features/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:movieapp/features/movie/domain/usecases/get_trending_movies.dart';
import 'package:movieapp/features/tv/data/datasources/tv.dart';
import 'package:movieapp/features/tv/data/repositories/tv.dart';
import 'package:movieapp/features/tv/domain/repositories/tv.dart';
import 'package:movieapp/features/tv/domain/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TvApiServiceImpl());


  //repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());



  //usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());



}
