import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:findtrackapp/bloc/favorites_bloc.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final FavBloc  = BlocProvider.of<FavoritesBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Column(
        children: [
          BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
              return 
              Text("El número de clicks es: ${FavBloc.state.counter} ");
            },
          ),
          MaterialButton(
            onPressed: () {
              FavBloc.add(IncCountEvent(FavBloc.state.counter + 1));
            },
            color: Colors.amber,
            textColor: Colors.black,
            child: Text("+1"),
          )
        ],
      )
    );
  }
}