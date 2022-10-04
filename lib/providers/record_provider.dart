import 'dart:io';

import 'package:flutter/material.dart';

class RecordProvider with ChangeNotifier {
  String _listen = "Toque para escuchar.";

  get Listen {
    return _listen;
  }

  listening () async {
    _listen = "Escuchando...";
    notifyListeners();
    sleep(Duration(seconds:2));
    // _listen = "Toque para escuchar.";
    // notifyListeners();
  }
    

}