// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/models/Category.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/screen/category_movies_screen.dart';

class Categories extends StatelessWidget {
  Genres genres;
  CategoryType categoryType;
  Categories(this.genres, this.categoryType, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CategoryMoviesDetails.routeName , arguments: genres);
        print(genres.name);
        print(genres.id);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          InkWell(
            onTap: () {
              
            },
            child: Image.asset(
              'assets/images/${categoryType.imageName}',
              width: 180,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 150,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  genres.name ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
