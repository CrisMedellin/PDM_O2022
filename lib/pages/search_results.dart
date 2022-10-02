import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Here you go'),
      ),
      body: Container (
        child: Column(
          children: [
            Image.network("https://i.scdn.co/image/d3acaeb069f37d8e257221f7224c813c5fa6024e"),

            // Padding(padding: EdgeInsets.only(top:16.0, bottom: 16)),

            Text("Warriors", style: TextStyle (fontSize: 25),),
            Text("Smoke and Mirrors", style: TextStyle (fontSize: 18),),
            Text("Imagine Dragons", style: TextStyle (fontSize: 15),),
            Text("2014-18-09", style: TextStyle (fontSize: 15),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.spotify, size: 50,), onPressed: () {
                  
                },),
                IconButton(icon: FaIcon(FontAwesomeIcons.podcast, size: 50,), onPressed: () {
                  
                },),
                IconButton(icon: FaIcon(FontAwesomeIcons.apple, size: 50,), onPressed: () {
                  
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
}
