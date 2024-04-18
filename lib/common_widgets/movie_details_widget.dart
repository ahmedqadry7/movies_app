import 'package:flutter/material.dart';

import '../network/remote/api_manager.dart';

class MovieDdetailsWidget extends StatelessWidget {
  const MovieDdetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return  FutureBuilder(
      future: ApiManager.getMovieDetails(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
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
                Image.network(
                  'https://image.tmdb.org/t/p/original${bath}',
                  fit: BoxFit.cover,
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
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original${bath}',
                    fit: BoxFit.cover,
                  ),
                  width: 140,
                  height: 200,
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
                                color: Colors.white, fontSize: 15),
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
    );
  }
}
