import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/common_widgets/new_releases_widget.dart';
import 'package:movies_app/common_widgets/popular_movie_item.dart';
import 'package:movies_app/common_widgets/recommended_movies_widget.dart';

class HomeTap extends StatelessWidget {
  HomeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          PopularWidget(),
          const SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Releases",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                NewReleasesWidget(),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            height: 245,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),
                RecommendedMoviesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
