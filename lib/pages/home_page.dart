// import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicfindapp/providers/audd_provider.dart';
import 'package:musicfindapp/providers/record_provider.dart';
import 'package:provider/provider.dart';
import 'package:avatar_glow/avatar_glow.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final RecProv = Provider.of<RecordProvider>(context);

    return Scaffold(
      body: 

      Container (
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,          
          children: [
            Text (RecProv.Listen, style: TextStyle (fontSize: 20),),
            AvatarGlow(
              glowColor: Colors.deepPurpleAccent,
              endRadius: 170,
              child: MaterialButton (
                onPressed: () async {
                  RecordProvider().listening;
                  sleep(Duration(seconds:3));
                  AudDProvider().gessSong();
                  Navigator.of(context).pushNamed("/search_results");
                },
                elevation: 8.0,
                shape: CircleBorder(),
                child: 
                CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  radius: 90,
                  backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/006/559/143/small_2x/music-note-logo-template-free-vector.jpg"),
                ),
              ),
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  IconButton(icon: FaIcon (FontAwesomeIcons.heart,), onPressed: () {
                    Navigator.of(context).pushNamed("/favorites");
                    }, 
                  )
              ],
            ),
          ],
        ),
      )

    );
  }
}

