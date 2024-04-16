import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/category_model.dart';
import 'package:movies_app/models/category_movies_model.dart';
import 'package:movies_app/models/new_releases_movies_model.dart';
import 'package:movies_app/models/popular_movies_model.dart';
import 'package:movies_app/models/recommended_movies_model.dart';

class ApiManager {
  static Future<PopularMoviesModel> getPopular() async {
    var url = Uri.https(
      Constants.BASE_URL,
      '/3/movie/popular',
      {
        'api_key': Constants.api_key,
      },
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var popularResponse = PopularMoviesModel.fromJson(json);
    return popularResponse;
  }

  static Future<NewReleasesMoviesModel> getNewReleases() async {
    var url = Uri.https(
      Constants.BASE_URL,
      '/3/movie/upcoming',
      {
        'api_key': Constants.api_key,
        'language': 'en-US',
        'page': '1',
      },
    );

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newReleasesResponse = NewReleasesMoviesModel.fromJson(json);
    return newReleasesResponse;
  }

  static Future<RecommendedMoviesModel> getRecommended() async {
    var url = Uri.https(Constants.BASE_URL, '/3/movie/top_rated',
        {'api_key': Constants.api_key});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RecommendedMoviesModel recommendedResponse =
        RecommendedMoviesModel.fromJson(json);
    return recommendedResponse;
  }

  static Future<CategoryModel> getCategory() async {
    var url = Uri.https(
      Constants.BASE_URL,
      '/3/genre/movie/list',
      {'api_key': Constants.api_key},
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var categoryModel = CategoryModel.fromJson(json);
    return categoryModel;
  }

  static Future<CategoryMoviesModel> getCategoryMovies(int id) async {
    var url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api-key=1fa432ee18877d5a1dbb6bea9c6c4df5&with_genres=$id');
    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3YzE3MmMzODNhZDY4OGY3MWFmOWNlYjcwOGFkNjNiNCIsInN1YiI6IjY2MWQ1ZjFmMGU1YWJhMDE4NmY1ODA3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0bkmenMOwDyksVQdPwze5hXjEG8jraZ3P1K2vnjKdZA',
        'accept': 'application/json'
      },
    );
    Map<String, dynamic> json = jsonDecode(response.body);
    return CategoryMoviesModel.fromJson(json);
  }
}
