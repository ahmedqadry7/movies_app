import 'package:flutter/material.dart';

import '../network/remote/api_manager.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return   FutureBuilder(future: ApiManager.getSimilar(id), builder:(context, snapshot) {
      if (ConnectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Text("Error");
      }

      var similarMoviesList = snapshot.data?.results ?? [];
      if (similarMoviesList.isEmpty) {
        return Center(child: Text("No Movies"));
      }
      return  Expanded(
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color(0xFF343534),
                borderRadius: BorderRadius.circular(12),
              ),
              width: 130,
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
                        Image.network(
                          'https://image.tmdb.org/t/p/original${similarMoviesList[index].backdropPath}',
                          fit: BoxFit.fill,
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
                        '${similarMoviesList[index].voteAverage}',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child:
                    Text('${similarMoviesList[index].title}',style: TextStyle(color: Colors.white),),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child:
                    Text('${similarMoviesList[index].releaseDate}',style: TextStyle(color: Colors.grey,fontSize: 12),),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 12,
          ),
          itemCount: similarMoviesList.length,
        ),
      );
    }

    );
  }
}
