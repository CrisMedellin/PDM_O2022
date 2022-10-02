import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AudDProvider with ChangeNotifier {
  var _auddEndpoint = "https://api.audd.io/";
  var _dataToPost = {'api_token': '   ','url': 'https://audd.tech/example.mp3', 'return': 'apple_music,spotify'};
  var song = jsonDecode('{}');
  
  Future <dynamic> gessSong () async {
    try {
      var _response = await post(Uri.parse(_auddEndpoint), body: _dataToPost);
      if (_response.statusCode == HttpStatus.ok) {
        var _content = jsonDecode (_response.body);
        song = _content;
        song = song['results']['title'];
        notifyListeners();
      }
    } catch (e) {
      song = jsonDecode('{}');
      notifyListeners();
    }
  }
}