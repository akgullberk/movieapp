import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/tv/domain/repositories/tv.dart';
import 'package:movieapp/service_locator.dart';

class GetPopularTVUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
