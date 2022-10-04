import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:musicfindapp/providers/favorites_provider.dart';


class AudDProvider with ChangeNotifier {
  var _auddEndpoint = Uri.parse("https://api.audd.io/");
  var _dataToPost = {
    'api_token': ' UniqueApiToken ',
    'url': 'https://audd.tech/example.mp3',
    'return': 'apple_music,spotify'
  };
  var song = jsonDecode('{"title":"Warriors", "album":"Smoke and Mirros", "artist":"Imagine Dragons", "release_date":"2014-18-09", "image":"https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"}');
  String picture = "https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e";
  String title = "Warriors";
  String album = "Smoke and Mirros";
  String artist= "Imagine Dragons";
  String date = "2014-18-09";
 

  Future<dynamic> gessSong () async {
    final _response = await post(_auddEndpoint, body: _dataToPost);
    try {
      if (_response.statusCode == 200) {
        final _content = jsonDecode(_response.body);
        song = _content["result"];
        FavoritesProvider().saveLastSearch(_content["results"]);
        picture = jsonEncode(song["spotify"]["album"]["images"][1]["url"]);
        title = jsonEncode(song["title"]);
        album = jsonEncode(song["album"]);
        artist = jsonEncode(song["artist"]);
        date = jsonEncode(song["release_date"]);
        notifyListeners();
      } else {
        print("Failed response, status code: "+_response.toString());
      }
    } catch (e) {
      print("Error:");
      print(e);
    }
  }
}

