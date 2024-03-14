import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:jezt_app/pages/movie.dart';
import 'package:jezt_app/pages/news.dart';
import 'package:jezt_app/pages/whether.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int? selectedindex = 0;
  final List pages = [whetherPage(), newsPage(), moviePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
          },
          backgroundColor: selectedindex == 0
              ? const Color.fromARGB(1000, 176, 224, 230)
              : selectedindex == 1
                  ? Color.fromARGB(1000, 216, 191, 216)
                  : const Color.fromARGB(1000, 172, 225, 175),
          buttonBackgroundColor: selectedindex == 0
              ? const Color.fromARGB(
                  1000,
                  96,
                  130,
                  182,
                )
              : selectedindex == 1
                  ? const Color.fromARGB(1000, 238, 130, 238)
                  : const Color.fromARGB(1000, 169, 186, 157),
          color: selectedindex == 0
              ? const Color.fromARGB(1000, 96, 130, 182)
              : selectedindex == 1
                  ? const Color.fromARGB(1000, 238, 130, 238)
                  : const Color.fromARGB(1000, 169, 186, 157),
          animationDuration: const Duration(milliseconds: 300),
          items: const <Widget>[
            Icon(
              Icons.cloudy_snowing,
              size: 26,
              color: Colors.white,
            ),
            Icon(
              Icons.newspaper,
              size: 26,
              color: Colors.white,
            ),
            Icon(
              Icons.movie_creation_outlined,
              size: 26,
              color: Colors.white,
            )
          ]),
      body: pages[selectedindex!],
    );
  }
}
