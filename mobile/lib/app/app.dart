import 'package:flutter/material.dart';

import '../features/create/create_screen.dart';
import '../features/favorites/favorites_screen.dart';
import '../features/home/home_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/search/search_screen.dart';

class HomeMadeRecipeApp extends StatefulWidget {
  const HomeMadeRecipeApp({super.key});

  @override
  State<HomeMadeRecipeApp> createState() => _HomeMadeRecipeAppState();
}

class _HomeMadeRecipeAppState extends State<HomeMadeRecipeApp> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    SearchScreen(),
    CreateScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Made Recipe',
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            NavigationDestination(
              icon: Icon(Icons.add_circle_outline),
              selectedIcon: Icon(Icons.add_circle),
              label: "Create",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: "Favorites",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}