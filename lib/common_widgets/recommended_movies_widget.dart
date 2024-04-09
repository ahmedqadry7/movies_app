import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  const RecommendedMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
                                'https://image.tmdb.org/t/p/original${recommendedMovies[index].backdropPath}',
                                fit: BoxFit.cover,
                              ),
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
                            '${recommendedMovies[index].voteAverage}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                            Text('${recommendedMovies[index].title}',style: TextStyle(color: Colors.white),),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child:
                            Text('${recommendedMovies[index].releaseDate}',style: TextStyle(color: Colors.grey,fontSize: 12),),
                      ),
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
    );
  }
}
