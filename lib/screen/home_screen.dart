import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
import 'package:movies_app/layouts/browse_tap.dart';
import 'package:movies_app/layouts/home_tap.dart';
import 'package:movies_app/layouts/search_tap.dart';
import 'package:movies_app/layouts/watch_list_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Homescreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: Container(
      //     height: 50,
      //     width: 200,
      //     child: Lottie.network(
      //         "https://lottie.host/19e350a3-71fb-41e6-af52-a69cac311867/rvj70SfJEh.json"),
      //   ),
      //   centerTitle: true,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.movie),
              label: 'Browse'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.collections_bookmark),
              label: 'Watchlist'),
        ],
      ),
      body: tabs[selectedTabIndex],
    );
  }

  var tabs = [HomeTap(), SearchTap(), BrowseTap(), WatchListTap()];

  int selectedTabIndex = 0;
}
