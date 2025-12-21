import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Overview',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text(overview, style: Theme.of(context).primaryTextTheme.bodyMedium),
      ],
    );
  }
}
