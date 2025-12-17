import 'package:dartz/dartz.dart';
import 'package:movieapp/features/auth/data/models/signin_req_params.dart';
import 'package:movieapp/features/auth/data/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();

}