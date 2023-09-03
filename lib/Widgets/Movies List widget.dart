import 'package:flutter/material.dart';
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:movie_app/Screens/movieDetailsScreen.dart';
import 'package:movie_app/Screens/movieList_Screen.dart';
import 'package:movie_app/modals/movie.dart';


class MovieListWidget extends StatelessWidget {
  final Future<List<dynamic>> future;
  String title;
  late Movies movies;

  bool titleVisibility;
  bool INtitleVisibility;
  bool rate;

  // VoidCallback onTap;

  MovieListWidget(
      {required this.title,
      required this.future,
      required this.titleVisibility,
      required this.rate,

/*
      required this.onTap,
*/
      required this.INtitleVisibility});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'SFProDisplay',
              fontSize: 18,
              color: Color(0xff666666),
            ),
          ),
        ),
        const SizedBox(
          height: 17,
        ),
        FutureBuilder<List<dynamic>>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            } else {
              return SizedBox(
                height: 270,
                child: ListView.builder(
                  itemCount: 9,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 8) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListScreen( title: title, future: future,)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 60, right: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Container(
                              width: 140,
                              color: const Color(0XFFFECB2F),
                              child: const Center(
                                child: Text(
                                  ' More',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailScreen(
                                          movie: snapshot.data![index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      '${ApiSetting.imagePath}${snapshot.data![index].posterPath}',
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                      width: 140,
                                      height: 210,
                                    ),
                                  ),
                                ),
                                rate
                                    ? Positioned(
                                        top: 5,
                                        right: 9,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: LinearGradient(
                                              begin:
                                                  AlignmentDirectional.topStart,
                                              end: AlignmentDirectional
                                                  .bottomEnd,
                                              colors: [
                                                Color(0xFFF99F00),
                                                Color(0xFFE42062),
                                              ],
                                            ),
                                          ),
                                          padding:
                                              const EdgeInsetsDirectional.all(
                                                  3.5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.baseline,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                            children: [
                                              Text(
                                                snapshot
                                                    .data![index].voteAverage!
                                                    .toInt()
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                (snapshot.data![index]
                                                            .voteAverage! %
                                                        1)
                                                    .toStringAsFixed(1)
                                                    .substring(1),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(),
                                INtitleVisibility
                                    ? Positioned(
                                        right: 10,
                                        bottom: 9,
                                        left: 10,
                                        child: Text(
                                          '${snapshot.data![index].title}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'SFProDisplay',
                                            fontSize: 12,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            titleVisibility
                                ? SizedBox(
                                    width: 140,
                                    child: Center(
                                      child: Text(
                                        snapshot.data![index].title,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                          fontFamily: 'SFProDisplay',
                                          fontSize: 15,
                                          color: Color(0xff222222),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      );
                    }
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
