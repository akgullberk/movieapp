import 'package:dartz/dartz.dart';
import 'package:movieapp/core/usecase/usecase.dart';
import 'package:movieapp/features/tv/domain/repositories/tv.dart';
import 'package:movieapp/service_locator.dart';


class SearchTVUseCase extends Usecase<Either,String> {
  
  @override
  Future<Either> call({String ? params}) async {
    return await sl<TvRepository>().searchTV(params!);
  }
  
}