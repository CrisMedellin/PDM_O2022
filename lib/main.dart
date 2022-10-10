import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_bar_bloc.dart';
import 'pages/book_details.dart';
import 'pages/home_page.dart';


void main() => runApp(AppState());
// void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  // const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBarBloc> (create: ( _ ) => SearchBarBloc() )
      ],
      child: MyApp()
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'Tarea 3',
      // initialRoute: '/home_page',
      home: HomePage(),
      routes: {
        '/home_page' : (context) => HomePage(),
        '/book_details' : (context) => BookDetails ()
      },
    );
  }
}