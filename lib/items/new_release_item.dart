// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/bookmarked_movies_model.dart';
import 'package:movies_app/models/new_releases_movies_model.dart';
import 'package:movies_app/network/DB/firebase_functions.dart';
import 'package:movies_app/screen/movie_details_screen.dart';

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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsScreen.routeName,
          arguments: {
            'id': widget.results.id,
            'title': widget.results.title,
          },
        );
      },
      child: SizedBox(
        height: 200,
        width: 120,
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'https://image.tmdb.org/t/p/original${widget.results.backdropPath}',
                placeholder: (context, url) => CircularProgressIndicator(color: Colors.yellow,),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                      BookMarkedMoviesModel movie = BookMarkedMoviesModel(
                          backdropPath:
                              'https://image.tmdb.org/t/p/original${widget.results.backdropPath}',
                          releaseDate: widget.results.releaseDate.toString(),
                          title: widget.results.title.toString());
                      FirebaseFunctions.addMovie(movie);
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
      ),
    );
  }
}
