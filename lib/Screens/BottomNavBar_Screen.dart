import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/Screens/ProflieScreen.dart';
import 'package:movie_app/Screens/home_Screen.dart';
import 'package:movie_app/Screens/tvScreen.dart';
import 'package:movie_app/modals/BnScreen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
 List<BnScrean> _bnScreen =<BnScrean> [
   BnScrean(widget: HomeScreen()),
   BnScrean(widget: TvScreen()),
   BnScrean(widget: ProfileScreen())
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _bnScreen[_currentIndex].widget
              // Your screen content here
            ),
          ),
          ClipRect(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // Only apply shadow at the top
                  ),
                ],
              ),
              child: BottomNavigationBar(
                elevation: 0, // No elevation for BottomNavigationBar
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: SvgPicture.asset('images/Movie.svg'),
                    activeIcon: SvgPicture.asset('images/movieactive.svg'),
                    label: '', // Add a label for the item
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('images/profileanact.svg'),
                    activeIcon: SvgPicture.asset('images/profileavtive.svg'),
                    label: '', // Add a label for the item
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('images/tvdisa.svg'),
                    activeIcon: SvgPicture.asset('images/tvactive.svg'),
                    label: '', // Add a label for the item
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 134,
            height: 5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color(0xff707070),
            ),
          ),
           SizedBox(height: 10),
        ],
      ),
    );
  }
}
