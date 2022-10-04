import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicfindapp/providers/audd_provider.dart';
import 'package:musicfindapp/providers/favorites_provider.dart';
import 'package:provider/provider.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudDProv = Provider.of<AudDProvider>(context);
    final FavoritesProv = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Here you go'),
      ),
      // body: ListView(
      //   children: [
      //     Image.network(AudDProv.picture),
      //     ListTile(
      //       title: Text(context.watch<AudDProvider>().title),
      //       subtitle: Text(context.watch<AudDProvider>().album),
      //     ),
      //     IconButton(icon: FaIcon (FontAwesomeIcons.heart,), onPressed: () {
      //         FavoritesProv.addRemove(AudDProv.song);
      //     },)
      //   ],
      // ),

      body: 
      Container (
        child:
        Column(
          children: [
            Image.network(AudDProv.picture),

            Text(AudDProv.title, style: TextStyle (fontSize: 25),),
            Text(AudDProv.album, style: TextStyle (fontSize: 18),),
            Text(AudDProv.artist, style: TextStyle (fontSize: 15),),
            Text(AudDProv.date, style: TextStyle (fontSize: 15),),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.spotify, size: 50,), onPressed: () {},),
                IconButton(icon: FaIcon(FontAwesomeIcons.podcast, size: 50,), onPressed: () {},),
                IconButton(icon: FaIcon(FontAwesomeIcons.apple, size: 50,), onPressed: () {},),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.heart, size: 50,), onPressed: () {
                  FavoritesProv.addRemove(AudDProv.song);
                },),
              ],
            )
          ],
        ),
      ),
    );
  }
}
