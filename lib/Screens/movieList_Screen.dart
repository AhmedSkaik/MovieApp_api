import 'package:flutter/material.dart';
import 'package:movie_app/Api/ApiSetting.dart';

import 'package:movie_app/Screens/movieDetailsScreen.dart';


class MovieListScreen extends StatelessWidget {
  MovieListScreen({Key? key, required this.title, required this.future})
      : super(
          key: key,
        );

  Future<List<dynamic>> future;

  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Back',
            style: TextStyle(color: Colors.black), textAlign: TextAlign.start),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              textAlign: TextAlign.start,
              title,
              style: const TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 18,
                  color: Color(0xff666666)),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No data available'));
                } else {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 120 / 220,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    GestureDetector(
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                              '${ApiSetting.imagePath}${snapshot.data![index].posterPath}')),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(movie: snapshot.data![index],)));
                                      },
                                    ),
                                    Positioned(
                                        top: 5,
                                        right: 9,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                  begin: AlignmentDirectional
                                                      .topStart,
                                                  end: AlignmentDirectional
                                                      .bottomEnd,
                                                  colors: [
                                                    Color(0xFFF99F00),
                                                    Color(0xFFE42062),
                                                  ])),
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
                                                  // Choose a color for the text
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )),
                                    Positioned(
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
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                  );
                }
              })
        ],
      ),
    );
  }
}
