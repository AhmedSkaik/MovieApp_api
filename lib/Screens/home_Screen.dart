import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/Api/ApiSetting.dart';
import 'package:movie_app/Api/ApiThriellerMOvie.dart';
import 'package:movie_app/Api/ApiTopRatedMovie.dart';
import 'package:movie_app/Api/Api_TreandingMovie.dart';
import 'package:movie_app/Api/popularMovie.dart';
import 'package:movie_app/Screens/movieDetailsScreen.dart';
import 'package:movie_app/Widgets/Movies%20List%20widget.dart';
import 'package:movie_app/modals/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _trendingMovies;
  late Future<List<dynamic>> _topRatedMovies;
  late Future<List<dynamic>> _popMovies;
  late Future<List<dynamic>> _ThrillerMovies;

  @override
  void initState() {
    super.initState();
    _trendingMovies = ApiTreandingMovie().getTreandingMovie();
    _topRatedMovies = ApiTopRated().getTopRated();
    _ThrillerMovies = ApiThrillerMovie().getThrillerMovie();
    _popMovies = ApiPopularMovie().getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 20, top: 36, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'MOVIE',
                    style: TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 24,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MovieListWidget(

              future: _trendingMovies,
              title: 'Treanding',
              titleVisibility: true,
              INtitleVisibility: false,
              rate: true,
            ),
            MovieListWidget(
                future: _topRatedMovies,
                title: 'Top Rated',
                titleVisibility: false,
                INtitleVisibility: true,
                rate: true),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     'Top Rated',
            //     style: TextStyle(
            //       fontFamily: 'SFProDisplay',
            //       fontSize: 18,
            //       color: Color(0xff666666),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 17,
            // ),
            // FutureBuilder<List<dynamic>>(
            //   future: _topRatedMovies,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('No data available'));
            //     } else {
            //       // List<dynamic> movies = snapshot.data!;
            //       return SizedBox(
            //         height: 220,
            //         child: ListView.builder(
            //           itemCount: 9,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) {
            //             if (index == 8) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   Navigator.pushNamed(context, '/movie_Screen');
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 20, bottom: 10, right: 20),
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(6),
            //                     child: Container(
            //                       width: 140,
            //
            //                       color: const Color(0XFFFECB2F),
            //
            //                       // Set your desired color
            //                       child: const Center(
            //                         child: Text(
            //                           ' More',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 18,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               return Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Column(
            //                   children: [
            //                     Stack(
            //                       children: [
            //                         GestureDetector(
            //                           onTap: () {
            //                             Navigator.push(
            //                               context,
            //                               MaterialPageRoute(
            //                                 builder: (context) => DetailScreen(
            //                                   movie: snapshot.data![index],
            //                                 ),
            //                               ),
            //                             );
            //                           },
            //                           child: ClipRRect(
            //                             borderRadius: BorderRadius.circular(6),
            //                             child: Image.network(
            //                               '${ApiSetting.imagePath}${snapshot.data![index].posterPath}',
            //                               fit: BoxFit.cover,
            //                               filterQuality: FilterQuality.high,
            //                               width: 140,
            //                               height: 210,
            //                             ),
            //                           ),
            //                         ),
            //                         Positioned(
            //                           top: 5,
            //                           right: 9,
            //                           child: Container(
            //                             decoration:  const BoxDecoration(
            //                               shape: BoxShape.circle,
            //                               gradient: LinearGradient(
            //                                 begin:
            //                                     AlignmentDirectional.topStart,
            //                                 end: AlignmentDirectional.bottomEnd,
            //                                 colors: [
            //                                   Color(0xFFF99F00),
            //                                   Color(0xFFE42062),
            //                                 ],
            //                               ),
            //                             ),
            //                             padding:
            //                                  const EdgeInsetsDirectional.all(
            //                                     3.5),
            //                             child:  Row(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.baseline,
            //                               textBaseline: TextBaseline.alphabetic,
            //                               children: [
            //                                 Text( snapshot.data![index].voteAverage!.toInt().toString(),
            //                                   style: const TextStyle(
            //                                     color: Colors.white,
            //                                     fontSize: 20,
            //                                   ),
            //                                 ),
            //
            //                                 Text(
            //                                   (snapshot.data![index].voteAverage! % 1).toStringAsFixed(1).substring(1),
            //                                   style: const TextStyle(
            //                                     color: Colors.white,
            //                                      fontSize: 12,
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                         Positioned(
            //                           right: 10,
            //                           bottom: 9,
            //                           left: 10,
            //                           child: Text(
            //                             '${snapshot.data![index].title}',
            //                             style: const TextStyle(
            //                               color: Colors.white,
            //                               fontFamily: 'SFProDisplay',
            //                               fontSize: 12,
            //                               fontWeight: FontWeight.w100,
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             }
            //           },
            //         ),
            //       );
            //     }
            //   },
            // ),

            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     'Action',
            //     style: TextStyle(
            //       fontFamily: 'SFProDisplay',
            //       fontSize: 18,
            //       color: Color(0xff666666),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 17,
            // ),
            // FutureBuilder<List<dynamic>>(
            //   future: _popMovies,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('No data available'));
            //     } else {
            //       // List<dynamic> movies = snapshot.data!;
            //       return SizedBox(
            //         height: 220,
            //         child: ListView.builder(
            //           itemCount: 9,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) {
            //             if (index == 8) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   Navigator.pushNamed(context, 'routeName');
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 20, bottom: 10, right: 20),
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(6),
            //                     child: Container(
            //                       width: 140,
            //
            //                       color: const Color(0XFFFECB2F),
            //
            //                       // Set your desired color
            //                       child: const Center(
            //                         child: Text(
            //                           ' More',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 18,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               return Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Stack(
            //                       children: [
            //                         ClipRRect(
            //                           borderRadius: BorderRadius.circular(6),
            //                           child: Image.network(
            //                             '${ApiSetting.imagePath}${snapshot.data![index].posterPath}',
            //                             fit: BoxFit.cover,
            //                             filterQuality: FilterQuality.high,
            //                             width: 140,
            //                             height: 210,
            //
            //                             // Replace with actual image URL
            //                           ),
            //                         ),
            //                         Positioned(
            //                           top: 5,
            //                           right: 9,
            //                           child: Container(
            //                             decoration: const BoxDecoration(
            //                               shape: BoxShape.circle,
            //                               gradient: LinearGradient(
            //                                 begin:
            //                                     AlignmentDirectional.topStart,
            //                                 end: AlignmentDirectional.bottomEnd,
            //                                 colors: [
            //                                   Color(0xFFF99F00),
            //                                   Color(0xFFE42062),
            //                                 ],
            //                               ),
            //                             ),
            //                             padding:
            //                                 const EdgeInsetsDirectional.all(
            //                                     3.5),
            //                             child: Row(
            //                               crossAxisAlignment:
            //                                   CrossAxisAlignment.baseline,
            //                               textBaseline: TextBaseline.alphabetic,
            //                               children: [
            //                                 Text(
            //                                   snapshot.data![index].voteAverage!
            //                                       .toInt()
            //                                       .toString(),
            //                                   style: const TextStyle(
            //                                     color: Colors.white,
            //                                     fontSize: 20,
            //                                   ),
            //                                 ),
            //                                 Text(
            //                                   (snapshot.data![index]
            //                                               .voteAverage! %
            //                                           1)
            //                                       .toStringAsFixed(1)
            //                                       .substring(1),
            //                                   style: const TextStyle(
            //                                     color: Colors.white,
            //                                     fontSize: 12,
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                         Positioned(
            //                           right: 10,
            //                           bottom: 9,
            //                           left: 10,
            //                           child: Text(
            //                             '${snapshot.data![index].title}',
            //                             style: const TextStyle(
            //                               color: Colors.white,
            //                               fontFamily: 'SFProDisplay',
            //                               fontSize: 12,
            //                               fontWeight: FontWeight.w100,
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             }
            //           },
            //         ),
            //       );
            //     }
            //   },
            // ),
            MovieListWidget(
                future: _popMovies,
                title: 'Action',
                titleVisibility: false,
                INtitleVisibility: true,
                rate: true),
            MovieListWidget(
                future: ApiThrillerMovie().getThrillerMovie(),
                title: 'Thrieller',
                titleVisibility: true,
                INtitleVisibility: false,
                rate: false),

            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     'Thriller',
            //     style: TextStyle(
            //       fontFamily: 'SFProDisplay',
            //       fontSize: 18,
            //       color: Color(0xff666666),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 17,
            // ),
            // FutureBuilder<List<dynamic>>(
            //   future: ApiThrillerMovie().getThrillerMovie(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('No data available'));
            //     } else {
            //       // List<dynamic> movies = snapshot.data!;
            //       return SizedBox(
            //         height: 270,
            //         child: ListView.builder(
            //           itemCount: 9,
            //           scrollDirection: Axis.horizontal,
            //           itemBuilder: (context, index) {
            //             if (index == 8) {
            //               return GestureDetector(
            //                 onTap: () {
            //                   Navigator.pushNamed(context, 'routeName');
            //                 },
            //                 child: Padding(
            //                   padding: const EdgeInsets.only(
            //                       left: 20, bottom: 60, right: 20),
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(6),
            //                     child: Container(
            //                       width: 140,
            //
            //                       color: const Color(0XFFFECB2F),
            //
            //                       // Set your desired color
            //                       child: const Center(
            //                         child: Text(
            //                           ' More',
            //                           style: TextStyle(
            //                             color: Colors.white,
            //                             fontSize: 18,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             } else {
            //               return Padding(
            //                 padding: const EdgeInsets.only(left: 20),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     ClipRRect(
            //                       borderRadius: BorderRadius.circular(6),
            //                       child: Image.network(
            //                         '${ApiSetting.imagePath}${snapshot.data![index].posterPath}',
            //                         fit: BoxFit.cover,
            //                         filterQuality: FilterQuality.high,
            //                         width: 140,
            //                         height: 210,
            //
            //                         // Replace with actual image URL
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 140,
            //
            //                       child: Text(
            //
            //                         snapshot.data![index].title,
            //                         // maxLines: 2,
            //                         overflow: TextOverflow.fade,
            //                         style: const TextStyle(
            //                           fontFamily: 'SFProDisplay',
            //                           fontSize: 15,
            //                           color: Color(0xff222222),
            //                         ),
            //                         textAlign: TextAlign.center,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               );
            //             }
            //             // var movie = snapshot.data![index];
            //           },
            //         ),
            //       );
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
