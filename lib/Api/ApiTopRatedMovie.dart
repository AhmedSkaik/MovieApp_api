import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:movie_app/modals/movie.dart';
import 'package:movie_app/modals/topRatedMov.dart';

class ApiTopRated {
  Future<List<Movies>> getTopRated() async {
    var uri = Uri.parse(ApiSetting.topRatedMovie);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var datajsonArrray = jsonData['results'] as List;
      return datajsonArrray.map((e) => Movies.fromJson(e)).toList();
    }
    return [];
  }
}
