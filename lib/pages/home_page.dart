import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicfindapp/providers/audd_provider.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 

      Container (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,          
          children: [
            Text ("Toque para escuchar", style: TextStyle (fontSize: 20),),
            AvatarGlow(
              glowColor: Colors.deepPurpleAccent,
              endRadius: 170,
              child: MaterialButton (
                onPressed: () async {
                  AudDProvider().gessSong();
                  print(AudDProvider().song);
                  sleep(Duration(seconds:2));
                  Navigator.of(context).pushNamed("/search_results");
                },
                elevation: 8.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 90,
                ),
              ),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  IconButton(icon: FaIcon (FontAwesomeIcons.heart,), onPressed: () {Navigator.of(context).pushNamed("/favorites");}, )
              ],
            ),
          ],
        ),
      )

    );
  }
}

// ListTile ( title: Text ("${context.read<AudDProvider>().song['result']['title']}"),),

// ListView.builder(
//   itemCount: 1,
//   itemBuilder: (BuildContext context, int index) {
//     var _gessedSong = context.read<AudDProvider>().song;
//     return ListTile(
//       title: Text("${_gessedSong['result']['title']}"),
//     );
//   }
// ),