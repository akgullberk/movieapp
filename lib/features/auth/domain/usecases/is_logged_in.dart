import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/auth/domain/repositories/auth.dart';
import 'package:movieapp/service_locator.dart';

class IsLoggedInUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
