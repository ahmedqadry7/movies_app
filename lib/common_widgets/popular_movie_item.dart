import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';
import 'package:movies_app/screen/movie_details_screen.dart';

class PopularWidget extends StatelessWidget {
  final PageController _controller = PageController(viewportFraction: 0.9);
  PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getPopular(),
      builder: (context, snapshot) {
        if (ConnectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.yellow,));
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
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MovieDetailsScreen.routeName,
                          arguments: {
                            'id': popularMovies[index].id,
                            'title': popularMovies[index].title,
                          },
                        );
                      },
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'https://image.tmdb.org/t/p/original${popularMovies[index].backdropPath}',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(color: Colors.yellow,),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
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
                      ),
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
