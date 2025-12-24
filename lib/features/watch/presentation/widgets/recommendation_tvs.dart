import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/bloc/generic_data_cubit.dart';
import 'package:movieapp/common/bloc/generic_data_state.dart';
import 'package:movieapp/common/widgets/tv/tv_card.dart';
import 'package:movieapp/features/tv/domain/entities/tv.dart';
import 'package:movieapp/features/tv/domain/usecases/get_recommendation_tv.dart';
import 'package:movieapp/service_locator.dart';

class RecommendationTvs extends StatelessWidget {
  final int tvId;
  const RecommendationTvs({super.key, required this.tvId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getData<List<TVEntity>>(
                sl<GetRecommendationTvUseCase>(),
                params: tvId,
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
                      return TVCard(tvEntity: state.data[index]);
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
