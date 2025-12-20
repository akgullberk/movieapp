import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/common/widgets/tv/tv_card.dart';
import 'package:movieapp/features/home/presentation/bloc/popular_tv_cubit.dart';
import 'package:movieapp/features/home/presentation/bloc/popular_tv_state.dart';

class PopularTv extends StatelessWidget {
  const PopularTv({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit()..getPopularTv(),
      child: BlocBuilder<PopularTvCubit, PopularTvState>(
        builder: (context, state) {
          if (state is PopularTvLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PopularTvLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.tv.length,
              ),
            );
          }

          if (state is FailureLoadPopularTv) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
