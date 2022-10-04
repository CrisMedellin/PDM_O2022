import 'package:flutter/material.dart';
import 'package:musicfindapp/pages/favorites.dart';
import 'package:musicfindapp/pages/home_page.dart';
import 'package:musicfindapp/pages/search_results.dart';
import 'package:musicfindapp/providers/audd_provider.dart';
import 'package:musicfindapp/providers/favorites_provider.dart';
import 'package:musicfindapp/providers/record_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AudDProvider()),
      ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ChangeNotifierProvider(create: (_) => RecordProvider()),
      // ChangeNotifierProvider(create: (_) => UrlLauncherProvider()),
    ],
    child:  MyApp(),
  ),
  );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Track App',
      color: Colors.purple,
      theme: ThemeData.dark(),
      initialRoute: '/home_page',
      routes: {
        "/home_page": (context) => HomePage(),
        "/favorites": (context) => Favorites(),
        "/search_results": (context) => SearchResults(),
      }
    );
  }
}

