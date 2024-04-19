// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/models/bookmarked_movies_model.dart';
import 'package:movies_app/models/similar_movies_model.dart';
import 'package:movies_app/network/DB/firebase_functions.dart';

class MoreLikeThisItem extends StatefulWidget {
  SimilarMoviesResults results;
  bool isClicked;
  MoreLikeThisItem({super.key, required this.results, required this.isClicked});

  @override
  State<MoreLikeThisItem> createState() => _MoreLikeThisNewReleaseItemState();
}

class _MoreLikeThisNewReleaseItemState extends State<MoreLikeThisItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF343534),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 130,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 130,
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: widget.results.backdropPath != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/original${widget.results.backdropPath}',
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 25,top: 40),
                              child: Text(
                                'No image available',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        onTap: () {
                          //Add to watchlist from here....................
                          setState(() {
                            widget.isClicked = !widget.isClicked;
                            BookMarkedMoviesModel movie = BookMarkedMoviesModel(
                                backdropPath:
                                    'https://image.tmdb.org/t/p/original${widget.results.backdropPath}',
                                releaseDate:
                                    widget.results.releaseDate.toString(),
                                title: widget.results.title.toString());
                            FirebaseFunctions.addMovie(movie);
                            
                          });
                        },
                        child: Image.asset(
                          widget.isClicked
                              ? 'assets/images/bookmarked.png'
                              : 'assets/images/bookmark.png',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/star.png',
                  scale: 0.8,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '${widget.results.voteAverage}',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${widget.results.title}',
                style: TextStyle(color: Colors.white),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                '${widget.results.releaseDate}',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
