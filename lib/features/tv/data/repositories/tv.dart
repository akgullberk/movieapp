import 'package:dartz/dartz.dart';
import 'package:movieapp/common/helper/mapper/tv_mapper.dart';
import 'package:movieapp/features/tv/data/datasources/tv.dart';
import 'package:movieapp/features/tv/data/models/tv.dart';
import 'package:movieapp/features/tv/domain/repositories/tv.dart';
import 'package:movieapp/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvService>().getPopularTv();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(
              data['content'],
            ).map((item) => TvMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
}
