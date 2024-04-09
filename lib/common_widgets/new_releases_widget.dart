import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class NewReleasesWidget extends StatelessWidget {
  const NewReleasesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewReleases(),
      builder: (context, snapshot) {
        if (ConnectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original${newRealeasesList[index].backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset('assets/images/bookmark.png'),
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
    );
  }
}
