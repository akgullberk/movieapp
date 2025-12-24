import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTvs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);


}
