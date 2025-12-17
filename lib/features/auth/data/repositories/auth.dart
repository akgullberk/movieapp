import 'package:dartz/dartz.dart';
import 'package:movieapp/features/auth/data/datasources/auth_api_service.dart';
import 'package:movieapp/features/auth/data/models/signin_req_params.dart';
import 'package:movieapp/features/auth/data/models/signup_req_params.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  
  @override
  Future<Either> signup(SignupReqParams params) async {
      var data = await sl<AuthApiService>().signup(params);
      return data.fold(
        (error){
          return Left(error);
        },
        (data) async{
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', data['user']['token']);
          return Right(data);
        }
      );
  }
  
  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signin(params);
      return data.fold(
        (error){
          return Left(error);
        },
        (data) async{
          final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', data['user']['token']);
          return Right(data);
        }
      );
  }
  
  @override
  Future<bool> isLoggedIn() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if(token == null) return false;
    return true;
  }
}

