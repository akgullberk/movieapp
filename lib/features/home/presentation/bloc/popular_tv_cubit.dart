import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/home/presentation/bloc/popular_tv_state.dart';
import 'package:movieapp/features/tv/domain/usecases/get_popular_tv.dart';
import 'package:movieapp/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

  void getPopularTv() async {
    var returnedData = await sl<GetPopularTVUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadPopularTv(errorMessage: error));
      },
      (data) {
        emit(PopularTvLoaded(tv: data));
      },
    );
  }
}
