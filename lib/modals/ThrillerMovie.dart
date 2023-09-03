class Thriller {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;


  Thriller.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'] as String;
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'] as String;
    originalTitle = json['original_title']as String;
    overview = json['overview']as String;
    popularity = json['popularity'].toDouble();
    posterPath = json['poster_path']as String;
    releaseDate = json['release_date']as String;
    title = json['title']as String;
    video = json['video'] ;
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
  }


}