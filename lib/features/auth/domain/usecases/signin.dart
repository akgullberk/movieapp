import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/auth/data/models/signin_req_params.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/service_locator.dart';

class SigninUseCase extends Usecase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}