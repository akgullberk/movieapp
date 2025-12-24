import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp/common/helper/mapper/keyword_mapper.dart';
import 'package:movieapp/common/helper/mapper/tv_mapper.dart';
import 'package:movieapp/core/models/keyword.dart';
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

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TvService>().getRecommendationTVs(tvId);

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

  @override
  Future<Either> getSimilarTvs(int tvId) async {
    var returnedData = await sl<TvService>().getSimilarTvs(tvId);

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

  @override
  Future<Either> getKeywords(int tvId) async {
    var returnedData = await sl<TvService>().getKeywords(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content'])
                .map(
                  (item) => KeywordMapper.toEntity(KeywordModel.fromJson(item)),
                )
                .take(5)
                .toList();
        return Right(movies);
      },
    );
  }
  
  @override
  Future<Either> searchTV(String query) async {
    var returnedData = await sl<TvService>().searchTV(query);

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
