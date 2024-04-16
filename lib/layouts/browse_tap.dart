import 'package:flutter/material.dart';
import 'package:movies_app/common_widgets/categories.dart';
import 'package:movies_app/models/Category.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/network/remote/api_manager.dart';

class BrowseTap extends StatelessWidget {
  const BrowseTap({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryType.getAllCategories();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Column(
        children: [
          Text(
            "Browse Category",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder<CategoryModel>(
            future: ApiManager.getCategory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var categoryResponse = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemBuilder: (context, index) {
                      var genres = categoryResponse.genres![index];
                      //Screen of images and types of categorires
                      return Categories(genres, categories[index]);
                    },
                    itemCount: categoryResponse.genres?.length,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Error loading category.');
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
