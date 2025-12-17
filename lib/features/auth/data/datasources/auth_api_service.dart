import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/features/auth/data/models/signin_req_params.dart';
import 'package:movieapp/features/auth/data/models/signup_req_params.dart';
import 'package:movieapp/service_locator.dart';

abstract class AuthApiService {
  Future <Either> signup(SignupReqParams params);
  Future <Either> signin(SigninReqParams params);

}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try{
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
      
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try{
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
      
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

}