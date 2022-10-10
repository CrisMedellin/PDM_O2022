// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:share_plus/share_plus.dart';

// import 'package:test_flutter_bloc/bloc/search_bar_bloc.dart';
import '../widgets/search_results.dart';

class BookDetails extends StatelessWidget {
  BookDetails({super.key});

  @override
  Widget build(BuildContext context) {

    // final searchBloc = BlocProvider.of<SearchBarBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("Detalles del Libro"),
          backgroundColor: Colors.grey[800],
          actions: [
            MaterialButton(
              onPressed: () async{
                // await Share.share( "${jsonDecode(searchBloc.state.bookArr)[1]['volumeInfo']['title']} por ${jsonDecode(searchBloc.state.bookArr)[1]['volumeInfo']['authors'][0]}");
                Share.share("Padre Rico Padre Pobre, por Robert Kiyosaki");
              },
              child: Icon(Icons.share, color: Colors.white,),
            )
          ],
      ),
      body: SearchResults(),
    );
  }
}