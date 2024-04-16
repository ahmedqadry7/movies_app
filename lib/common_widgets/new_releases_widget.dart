import 'package:flutter/material.dart';
import 'package:movies_app/items/new_release_item.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class NewReleasesWidget extends StatefulWidget {
  const NewReleasesWidget({super.key});

  @override
  State<NewReleasesWidget> createState() => _NewReleasesWidgetState();
}

class _NewReleasesWidgetState extends State<NewReleasesWidget> {
  bool isBookmarked = false;

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
                return NewReleaseItem(results: newRealeasesList[index] , isClicked: isBookmarked,);
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
