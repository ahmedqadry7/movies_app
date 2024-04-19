// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/bookmarked_movies_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:movies_app/network/DB/firebase_functions.dart';

class BookMarkedMoviesItem extends StatelessWidget {
  BookMarkedMoviesModel model;
  BookMarkedMoviesItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        extentRatio: 0.5,
        children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteMovie(model.id);
            },
            backgroundColor: Colors.red,
            label: "Delete",
            icon: Icons.delete,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/original${model.backdropPath}",
                placeholder: (context, url) => CircularProgressIndicator(color: Colors.yellow,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      model.title,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Text(
                    model.releaseDate,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
