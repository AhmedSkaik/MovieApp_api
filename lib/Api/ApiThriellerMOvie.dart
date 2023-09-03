import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:movie_app/modals/movie.dart';

class ApiThrillerMovie {
  Future<List<Movies>> getThrillerMovie() async {
    var uri = Uri.parse(ApiSetting.thrieller);
    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      print(jsonData);

      var datajsonArray = jsonData['results'] as List;
      return datajsonArray.map((e) => Movies.fromJson(e)).toList();
    }

    return [];
  }
}
