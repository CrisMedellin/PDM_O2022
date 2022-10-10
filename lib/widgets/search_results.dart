import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bar_bloc.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {

    final searchBloc = BlocProvider.of<SearchBarBloc>(context);
    return
        BlocBuilder<SearchBarBloc, SearchBarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(jsonDecode(state.currentBook)['image'], scale: 0.5,),
                    Divider(height: 20),
                    Text(jsonDecode(state.currentBook)['title'], style: TextStyle(fontSize: 20),),
                    Text(jsonDecode(state.currentBook)['date'], style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text(jsonDecode(state.currentBook)['author'], style: TextStyle(fontSize: 15),),
                    // Text(jsonDecode(state.currentBook)['description']),
                  ],
                ),
              ],
            );
          },
        );
  }
}
