import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import '../screen/movie_details.dart';

class PopularWidget extends StatelessWidget {
  final PageController _controller = PageController(viewportFraction: 0.9);
  PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
