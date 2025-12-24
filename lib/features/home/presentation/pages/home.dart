import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieapp/common/helper/navigation/app_navigation.dart';
import 'package:movieapp/common/widgets/appbar/app_bar.dart';
import 'package:movieapp/core/configs/assets/app_vectors.dart';
import 'package:movieapp/features/home/presentation/widgets/now_playing_movies.dart';
import 'package:movieapp/features/home/presentation/widgets/popular_tv.dart';
import 'package:movieapp/features/home/presentation/widgets/trending_movies.dart';
import 'package:movieapp/features/home/presentation/widgets/category_text.dart';
import 'package:movieapp/features/search/presentation/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          icon: Icon(Icons.search),
          onPressed:(){
            AppNavigator.push(context,SearchPage());
          },
        ),
        title: SvgPicture.asset(AppVectors.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryText(title: 'Trendings 🔥'),
            TrendingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Now Playing'),
            SizedBox(height: 16),
            NowPlayingMovies(),
            SizedBox(height: 16),
            CategoryText(title: 'Popular TV'),
            SizedBox(height: 16),
            PopularTv(),
            SizedBox(height: 16),

          ],
        ),
      ),
    );
  }
}
