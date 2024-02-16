import 'dart:ui';

import 'package:flutter/material.dart';
import '../pages/explore.dart';
import '../pages/home_page.dart';
import '../pages/liked.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState(
    
  );
  
}

class _MainPageState extends State<MainPage> {
  List pages = [const HomePage(), const ExplorePage(), const Liked()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              backgroundColor: Colors.black.withOpacity(.1),
              type: BottomNavigationBarType.fixed,
              onTap: onTap,
              selectedItemColor: Colors.white,
              unselectedItemColor: const Color.fromARGB(255, 7, 7, 7),
              elevation: 0,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedFontSize: 0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    activeIcon: Icon(Icons.home),
                    label: 'Домой'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    activeIcon: Icon(Icons.explore_rounded),
                    label: 'В тренде'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border),
                    activeIcon: Icon(Icons.favorite),
                    label: 'Избранное'),
              ]),
        ),
      ),
    );
  }
}
