import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/tv/domain/repositories/tv.dart';
import 'package:movieapp/service_locator.dart';

class GetKeywordsUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<TvRepository>().getKeywords(params!);
  }
}
