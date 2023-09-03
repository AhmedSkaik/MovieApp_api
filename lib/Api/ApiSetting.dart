import 'dart:convert';

import 'package:movie_app/Api/Apikey.dart';
import 'package:movie_app/modals/movie.dart'; // Import the constants object

class ApiSetting {
  static const String treandingmovie =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${constants.apikey}';

  static const String topRatedMovie =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${constants.apikey}';

  static const String popularmovie =
      'https://api.themoviedb.org/3/movie/popular?api_key=${constants.apikey}';


  static const String actionApi =
      'https://api.themoviedb.org/3/discover/movie?api_key=acc3db372696c9b43d35526c3ae65c0b&with_genres=53';
  static const String thrieller =
      'https://api.themoviedb.org/3/discover/movie?api_key=acc3db372696c9b43d35526c3ae65c0b&with_genres=28';

  static const String imagePath = 'https://image.tmdb.org/t/p/w500';
  static const String imagecastpath = 'https://api.themoviedb.org/3/movie/12345/credits';


}
