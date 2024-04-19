// ignore_for_file: unnecessary_import, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/common_widgets/more_like_this_widget.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class MovieDetailsScreen extends StatelessWidget {
  MovieDetailsScreen({super.key});

  static const String routeName = 'moviedetails';
  bool isBookmarked = false;
  @override
  Widget build(BuildContext context) {
    // int id = ModalRoute.of(context)!.settings.arguments as int;
    // NewReleasesResults results =
    //     ModalRoute.of(context)!.settings.arguments as NewReleasesResults;
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int id = args['id'];
    final String title = args['title'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                future: ApiManager.getMovieDetails(id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Something Went Wrong'));
                  }
                  var title = snapshot.data?.title;
                  var overveiw = snapshot.data?.overview;
                  var bath = snapshot.data?.backdropPath;
                  var date = snapshot.data?.releaseDate;
                  var vote = snapshot.data?.voteAverage;
                  var runtime = snapshot.data?.runtime;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          bath != null
                              ? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/original$bath',
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(
                                    color: Colors.yellow,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                )
                              : Text(
                                  "No Image available",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                          Positioned(
                            bottom: 100,
                            left: 180,
                            child: CircleAvatar(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 40,
                              ),
                              backgroundColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$title',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                          Text(
                            '$date  $runtime m',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 140,
                            height: 200,
                            child: bath != null
                                ? CachedNetworkImage(
                                  fit: BoxFit.cover,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/original$bath',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(color: Colors.yellow,),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                                : Text(
                                    "No Image available",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    '$overveiw',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
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
                                      '$vote',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'More Like This',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    MoreLikeThisWidget(id: id, isBookmarked: isBookmarked),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
