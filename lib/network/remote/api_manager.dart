import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:movies_app/constants.dart';
import 'package:movies_app/models/new_releases_movies_model.dart';
import 'package:movies_app/models/popular_movies_model.dart';
import 'package:movies_app/models/recommended_movies_model.dart';

class ApiManager {
  static Future<PopularMoviesModel> getPopular() async {
    var url = Uri.https(Constants.BASE_URL, '/3/movie/popular', {
      'api_key': '1fa432ee18877d5a1dbb6bea9c6c4df5',
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var popularResponse = PopularMoviesModel.fromJson(json);
    return popularResponse;
  }

  static Future<NewReleasesMoviesModel> getNewReleases() async {
    var url = Uri.https(Constants.BASE_URL, '/3/movie/upcoming', {
      'api_key': '1fa432ee18877d5a1dbb6bea9c6c4df5',
      'language': 'en-US',
      'page': '1',
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newReleasesResponse = NewReleasesMoviesModel.fromJson(json);
    return newReleasesResponse;
  }

  static Future<RecommendedMoviesModel> getRecommended() async {
    var apiKey = '1fa432ee18877d5a1dbb6bea9c6c4df5';
    var url =
        Uri.https(Constants.BASE_URL, '/3/tv/top_rated', {'api_key': apiKey});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RecommendedMoviesModel recommendedResponse =
        RecommendedMoviesModel.fromJson(json);
    return recommendedResponse;
  }
}
