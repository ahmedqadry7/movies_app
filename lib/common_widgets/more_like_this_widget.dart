// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movies_app/items/moreLikethis_item.dart';
import 'package:movies_app/network/remote/api_manager.dart';
import 'package:movies_app/screen/movie_details_screen.dart';

class MoreLikeThisWidget extends StatelessWidget {
  int id;
  bool isBookmarked;
  MoreLikeThisWidget({super.key , required this.id ,required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSimilar(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.yellow,),
          );
        }
        if (snapshot.hasError || snapshot.data == null) {
          return Text("Error Retrieving data");
        }
        var similarMoviesList = snapshot.data!.results ?? [];
        //print(similarMoviesList[0].title);
        if (similarMoviesList.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text("No Movies found" , style: TextStyle(color: Colors.grey,fontSize: 18),),
            ),
          );
        }
        return Expanded(
          child: Container(
            height: 500,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                //Item
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MovieDetailsScreen.routeName,
                      arguments: {
                        'id': similarMoviesList[index].id,
                        'title': similarMoviesList[index].title,
                      },
                    );
                  },
                  child: MoreLikeThisItem(
                    results: similarMoviesList[index],
                    isClicked: isBookmarked,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                width: 12,
              ),
              itemCount: similarMoviesList.length,
            ),
          ),
        );
      },
    );
  }
}
