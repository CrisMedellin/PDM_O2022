import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<dynamic> _favList = [];

  var lastSearch = {};

  get favList {
    return this._favList;
  }

  saveLastSearch (ls) async {
    this.lastSearch = ls;
  }

  addRemove(favSong) {
    print(favSong);
    var notReg = true;
    if (favList.length >= 1) {
      print(favList[0]["title"]);
      print(favSong["title"]);
      for (var i = 0; i < favList.length; i++) {
        if (favList[i]["title"] == favSong["title"] && favList[i]["artist"] == favSong["artist"]) {
          notReg = false;
        }
      }
    }
    if (notReg) {
      this._favList.add(favSong);
    } else {
      favList.remove(favSong);
    }
  }

}
