import 'dart:convert';
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/modals/movie.dart';
import 'package:movie_app/modals/popular_movie.dart';

class ApiPopularMovie {
  Future<List<Movies>> getPopularMovie() async {
    var uri = Uri.parse(
       ApiSetting.actionApi );
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      // MainResponse mainResponse = MainResponse.fromJson(jsonData);
      // return mainResponse.results;
      //
      var datajsonArrray = jsonData['results'] as List;
      return datajsonArrray.map((e) => Movies.fromJson(e)).toList();
    }
    return [];
  }
}
