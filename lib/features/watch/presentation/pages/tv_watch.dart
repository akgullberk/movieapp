import 'package:flutter/material.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/features/tv/domain/entities/tv.dart';
import 'package:movieapp/features/watch/presentation/widgets/recommendation_tvs.dart';
import 'package:movieapp/features/watch/presentation/widgets/similar_tvs.dart';
import 'package:movieapp/features/watch/presentation/widgets/tv_keywords.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_overview.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_player.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_title.dart';
import 'package:movieapp/features/watch/presentation/widgets/video_vote_average.dart';

class TvWatchPage extends StatelessWidget {
  final TVEntity tvEntity;
  const TvWatchPage({required this.tvEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoPlayer(id: tvEntity.id!),
              SizedBox(height: 16),
              VideoTitle(title: tvEntity.name!),
              SizedBox(height: 16),
              TVKeywords(tvId: tvEntity.id!),
              SizedBox(height: 16),
              VideoVoteAverage(voteAverage: tvEntity.voteAverage!),
              SizedBox(height: 16),
              VideoOverview(overview: tvEntity.overview!),
              SizedBox(height: 16),
              RecommendationTvs(tvId: tvEntity.id!),
              SizedBox(height: 16),
              SimilarTvs(tvId: tvEntity.id!),
            ],
          ),
        ),
      ),
    );
  }
}
