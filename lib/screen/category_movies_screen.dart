// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class CategoryMoviesDetails extends StatelessWidget {
  static const String routeName = "categoryMoviesDetails";
  CategoryMoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var genres = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          genres.name ?? "Default Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getCategoryMovies(genres.id ?? 28),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          } else if (snapshot.hasError) {
            return Text("Error, No Data");
          }
          var categoryMovies = snapshot.data?.results ?? [];
          if (categoryMovies.isEmpty) {
            return Center(
              child: Text(
                "No Movies",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                thickness: 2,
                color: Colors.grey,
                height: 5,
              );
            },
            itemBuilder: (context, index) {
              //Row of movie, Inkwell here
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original${categoryMovies[index].backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                categoryMovies[index].title ?? "",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Text(
                              categoryMovies[index].releaseDate ?? "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: categoryMovies.length,
          );
        },
      ),
    );
  }
}
