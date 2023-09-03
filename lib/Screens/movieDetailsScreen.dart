import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:movie_app/modals/movie.dart';
import 'package:movie_app/modals/topRatedMov.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, this.movie}) : super(key: key);
  final Movies? movie;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              '${ApiSetting.imagePath}${movie!.backdropPath}',
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
              width: double.infinity,
              height: 280,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const Text('Back', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset('images/Share.svg'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 200,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  '${ApiSetting.imagePath}${movie!.posterPath}',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  width: 140,
                  height: 210,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170, top: 295),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${movie!.voteCount} People Reviews'),
                  Text(movie!.mediaType.toString()),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            movie!.voteAverage!.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.red,
                              // Choose a color for the text
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            (movie!.voteAverage! % 1)
                                .toStringAsFixed(1)
                                .substring(1),
                            style: const TextStyle(
                              color: Colors.red,
                              // Choose a color for the text
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 14.1,
                      ),
                      RatingBar.builder(
                        initialRating: movie!.voteAverage! / 2,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 24,
                        ignoreGestures: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star_rounded,
                          color: Color(0xffD6182A),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 420, right: 20, left: 20),
                  child: Text(
                    '${movie!.overview}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xff666666),
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(top: 37, right: 20, left: 20, bottom: 33),
                  child: Text(
                    textAlign: TextAlign.start,
                    'Full Cast & Crew',
                    style: TextStyle(
                        fontFamily: 'SFProDisplay',
                        fontSize: 15,
                        color: Color(0xff666666)),
                  ),
                ),
                SizedBox(
                    height: 122,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Image.asset('images/actor.png'),
                                const Text(
                                  'data',
                                  style: TextStyle(
                                    fontFamily: 'SFProDisplay',
                                    fontSize: 15,
                                    color: Color(0xff222222),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(children: [
                      Container(
                        width: 54, // Adjust size as needed
                        height: 54,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ], // Circle color
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/like.svg', // Replace with your SVG file path
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'LIKE',
                        style: TextStyle(
                            fontFamily: 'SFProDisplayReg',
                            fontSize: 15,
                            color: Color(0xff999999)),
                      )
                    ]),
                    const SizedBox(
                      width: 46,
                    ),
                    Column(children: [
                      Container(
                        width: 54, // Adjust size as needed
                        height: 54,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/star.svg', // Replace with your SVG file path
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'FAVORITE',
                        style: TextStyle(
                            fontFamily: 'SFProDisplayReg',
                            fontSize: 15,
                            color: Color(0xff999999)),
                      )
                    ]),
                    const SizedBox(
                      width: 46,
                    ),
                    Column(children: [
                      Container(
                        width: 54, // Adjust size as needed
                        height: 54,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ]),
                        child: Center(
                          child: SvgPicture.asset(
                            'images/comment.svg', // Replace with your SVG file path
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'COMMENT',
                        style: TextStyle(
                            fontFamily: 'SFProDisplayReg',
                            fontSize: 15,
                            color: Color(0xff999999)),
                      )
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                Center(
                  child: Container(
                    width: 134,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xff707070)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
