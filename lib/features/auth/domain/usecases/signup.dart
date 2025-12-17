import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/auth/data/models/signup_req_params.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/service_locator.dart';

class SignupUseCase extends Usecase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}