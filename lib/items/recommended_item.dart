// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/models/recommended_movies_model.dart';

class RecommendedItem extends StatefulWidget {
  RecommendedResults results;
  bool isBookmarked;
  RecommendedItem(
      {super.key, required this.isBookmarked, required this.results});

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF282A28),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 130,
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
                    child: Image.network(
                      'https://image.tmdb.org/t/p/original${widget.results.backdropPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: InkWell(
                        //Add to watchList from here...
                        onTap: () {
                          widget.isBookmarked = !widget.isBookmarked;
                          setState(() {});
                        },
                        child: widget.isBookmarked
                            ? Image.asset(
                                'assets/images/bookmarked.png',
                              )
                            : Image.asset(
                                'assets/images/bookmark.png',
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
