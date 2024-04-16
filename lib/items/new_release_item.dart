// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/models/new_releases_movies_model.dart';

class NewReleaseItem extends StatefulWidget {
  NewReleasesResults results;
  bool isClicked;
  NewReleaseItem({super.key, required this.results, required this.isClicked});

  @override
  State<NewReleaseItem> createState() => _NewReleaseItemState();
}

class _NewReleaseItemState extends State<NewReleaseItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 120,
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
                onTap: () {
                  //Save to watchlist from here
                  setState(() {
                    widget.isClicked = !widget.isClicked;
                  });
                },
                child: widget.isClicked
                    ? Image.asset('assets/images/bookmarked.png')
                    : Image.asset('assets/images/bookmark.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}