import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movieapp/core/constants/api_url.dart';
import 'package:movieapp/core/network/dio_client.dart';
import 'package:movieapp/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTv();
}

class TvApiServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try{
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
      
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

}