import 'package:flutter/material.dart';
import 'package:musicfindapp/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final fav = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount:  fav.favList.length,
        itemBuilder: (BuildContext context, int index) {
          var _itemUser = fav.favList[index];
          return ListTile(
            title: Text("${_itemUser["title"]}"),
          );
        }
      ),
    );
  }
}