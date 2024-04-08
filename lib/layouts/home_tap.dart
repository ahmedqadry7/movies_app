import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class HomeTap extends StatelessWidget {
  HomeTap({super.key});
  final PageController _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          FutureBuilder(
            future: ApiManager.getPopular(),
            builder: (context, snapshot) {
              if (ConnectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error");
              }
              var popularMovies = snapshot.data?.results ?? [];
              if (popularMovies.isEmpty) {
                return Center(child: Text("No Movies"));
              }
              return SizedBox(
                height: 250,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        allowImplicitScrolling: true,
                        controller: _controller,
                        itemCount: popularMovies.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.network(
                                'https://image.tmdb.org/t/p/original${popularMovies[index].backdropPath}',
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  popularMovies[index].title ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                popularMovies[index].releaseDate ?? "",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New Releases",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5,
                ),
                FutureBuilder(
                  future: ApiManager.getNewReleases(),
                  builder: (context, snapshot) {
                    if (ConnectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Error");
                    }
                    var newRealeasesList = snapshot.data?.results ?? [];
                    if (newRealeasesList.isEmpty) {
                      return Center(child: Text("No Movies"));
                    }
                    return Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 200,
                              width: 120,
                              child: Stack(
                                fit: StackFit.expand,
                                alignment: Alignment.topLeft,
                                children: [
                                  Image.network(
                                    'https://image.tmdb.org/t/p/original${newRealeasesList[index].backdropPath}',
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                          'assets/images/bookmark.png'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                width: 15,
                              ),
                          itemCount: newRealeasesList.length),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),
                FutureBuilder(
                  future: ApiManager.getRecommended(),
                  builder: (context, snapshot) {
                    if (ConnectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Text("Error");
                    }
                    var recommendedMovies = snapshot.data?.results ?? [];
                    if (recommendedMovies.isEmpty) {
                      return Center(child: Text("No Movies"));
                    }
                    return Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF282A28),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 120,
                                    child: Stack(
                                      fit: StackFit.expand,
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Image.network(
                                          'https://image.tmdb.org/t/p/original${recommendedMovies[index].backdropPath}',
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Image.asset(
                                              'assets/images/bookmark.png',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5,),
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
                                        '${recommendedMovies[index].voteAverage}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  // FittedBox(
                                  //   fit: BoxFit.scaleDown,
                                  //   child:
                                  //       Text('${recommendedMovies[index]}'),
                                  // )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          width: 12,
                        ),
                        itemCount: recommendedMovies.length,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
