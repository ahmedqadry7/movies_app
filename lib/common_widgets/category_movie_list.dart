// ignore_for_file: must_be_immutable
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies_app/models/category_movies_model.dart';

class CategoryMovieWidget extends StatelessWidget {
  Results? results;
  CategoryMovieWidget(Results? categoryMovi, {super.key , this.results});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.white,
              child: Center(
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${results?.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    results?.title
                            ?.substring(0, min(20, results!.title!.length)) ??
                        '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    results?.releaseDate?.length == 0
                        ? ''
                        : results?.releaseDate?.substring(0, 4) ?? '',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.67),
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14, left: 10.0, right: 10.0),
          child: Container(
            height: 1,
            width: double.infinity,
            color: Color.fromRGBO(255, 255, 255, 0.67),
          ),
        ),
      ],
    );
  }
}
