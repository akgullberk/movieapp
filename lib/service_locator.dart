import 'package:get_it/get_it.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/features/auth/data/datasources/auth_api_service.dart';
import 'package:movieapp/features/auth/data/repositories/auth.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/features/auth/domain/usecases/is_logged_in.dart';
import 'package:movieapp/features/auth/domain/usecases/signin.dart';
import 'package:movieapp/features/auth/domain/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator(){
  sl.registerSingleton<DioClient>(DioClient());

  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());


  
}

