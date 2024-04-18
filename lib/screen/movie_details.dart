import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import '../common_widgets/movie_details_widget.dart';
import '../common_widgets/similar_movies_widget.dart';
class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  static const String routeName = 'moviedetails';

  @override
  Widget build(BuildContext context) {
   // int id = ModalRoute.of(context)!.settings.arguments as int;
    //String title=ModalRoute.of(context)!.settings.arguments as String ;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'title',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          MovieDdetailsWidget(),
          SizedBox(height: 20,),
            SizedBox(
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   'More Like This',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                       ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SimilarMoviesWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
