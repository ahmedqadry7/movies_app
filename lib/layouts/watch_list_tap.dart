import 'package:flutter/material.dart';
import 'package:movies_app/items/bookmarked_movie_item.dart';
import 'package:movies_app/models/bookmarked_movies_model.dart';
import 'package:movies_app/network/DB/firebase_functions.dart';

class WatchListTap extends StatelessWidget {
  const WatchListTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Watch List",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFunctions.getBookmarkedMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow,
                  ),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text("Something went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              List<BookMarkedMoviesModel> moviesList =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (moviesList.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/noMovies.png"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "No Movies Found",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.grey,
                        height: 5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemBuilder: (context, index) {
                  return BookMarkedMoviesItem(model: moviesList[index]);
                },
                itemCount: moviesList.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
