import 'package:findtrackapp/pages/logout_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:findtrackapp/bloc/api_audd_bloc.dart';
import 'package:findtrackapp/bloc/favorites_bloc.dart';
import 'package:findtrackapp/pages/favorites.dart';
import 'package:findtrackapp/pages/home_page.dart';
import 'package:findtrackapp/pages/login/login_page.dart';
import 'package:findtrackapp/pages/search_result.dart';

// void main() => runApp(AppState());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider<ApiAuddBloc> (create: ( _ ) => ApiAuddBloc() ),
        BlocProvider<FavoritesBloc> (create: ( _ ) => FavoritesBloc() ),
      ],
      child: MaterialApp(
        title: 'Find Track App',
        debugShowCheckedModeBanner: false,
        color: Colors.purple,
        theme: ThemeData.dark(),
        routes: {
          "/home_page": (context) => HomePage(),
          "/favorites": (context) => FavoritesPage(),
          "/search_results": (context) => SearchResults(),
          "/login": (context) => LoginPage(),
          "/logout": (context) => LogoutPage(),
        },
        home: FirebaseAuth.instance.currentUser == null ? LoginPage() : HomePage(),
      ),
    );
  }
}

