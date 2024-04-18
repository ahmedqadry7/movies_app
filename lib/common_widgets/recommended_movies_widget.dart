// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/items/recommended_item.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  bool isBookmarked = false;
  RecommendedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRecommended(),
      builder: (context, snapshot) {
        if (ConnectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        var recommendedMovies = snapshot.data?.results ?? [];
        //print('recommendedMovies[1].id: ${recommendedMovies[0].id}');
        if (recommendedMovies.isEmpty) {
          return Center(
            child: Text("No Movies"),
          );
        }
        return Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return RecommendedItem(
                isBookmarked: isBookmarked,
                results: recommendedMovies[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 12,
            ),
            itemCount: recommendedMovies.length,
          ),
        );
      },
    );
  }
}
