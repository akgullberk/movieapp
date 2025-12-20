import 'package:movieapp/features/tv/domain/entities/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TVEntity> tv;

  PopularTvLoaded({required this.tv});
}

class FailureLoadPopularTv extends PopularTvState {
  final String errorMessage;

  FailureLoadPopularTv({required this.errorMessage});
}
