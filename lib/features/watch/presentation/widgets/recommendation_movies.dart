import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/bloc/generic_data_cubit.dart';
import 'package:movieapp/common/bloc/generic_data_state.dart';
import 'package:movieapp/common/widgets/movie/movie_card.dart';
import 'package:movieapp/features/movie/domain/entities/movie.dart';
import 'package:movieapp/features/movie/domain/usecases/get_recommendation_movies.dart';
import 'package:movieapp/service_locator.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<MovieEntity>>(
                sl<GetRecommendationMoviesUseCase>(),
                params: movieId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(movieEntity: state.data[index]);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.data.length,
                  ),
                ),
              ],
            );
          }

          if (state is FailureLoadData) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
