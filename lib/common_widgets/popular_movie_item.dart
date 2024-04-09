import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies_app/models/popular_movies_model.dart';

class popularWidget extends StatelessWidget {
  final Results movies;

  popularWidget(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Image.network(
                          "https://image.tmdb.org/t/p/original/${movies.backdropPath}"),
                    ),
                    Column(
                      children: [
                        Text(
                          movies.title?.substring(
                                  0, min(20, movies.title!.length)) ??
                              '',
                          style: const TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontFamily: "b"),
                        ),
                        Text(
                          movies.releaseDate ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xffB5B4B4),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
