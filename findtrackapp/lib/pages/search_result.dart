// import 'dart:io';

// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:findtrackapp/bloc/home_page_bloc.dart';
import 'package:findtrackapp/bloc/favorites_bloc.dart';
import 'package:findtrackapp/bloc/api_audd_bloc.dart';


class SearchResults extends StatelessWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AudDBloc = BlocProvider.of<ApiAuddBloc>(context, listen: false);
    final FavBloc = BlocProvider.of<FavoritesBloc>(context, listen: false);
    // final HomeBloc = BlocProvider.of<HomePageBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Here you go'),
      ),
      body: 
      Container (
        child:
        BlocBuilder<ApiAuddBloc, ApiAuddState>(
          builder: (context, state) {
            return 
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(AudDBloc.state.picture),

                  Text(AudDBloc.state.title, style: TextStyle (fontSize: 25),),
                  Text(AudDBloc.state.album, style: TextStyle (fontSize: 18),),
                  Text(AudDBloc.state.artist, style: TextStyle (fontSize: 15),),
                  Text(AudDBloc.state.date, style: TextStyle (fontSize: 15),),
                  AudDBloc.state.found ? 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(icon: FaIcon(FontAwesomeIcons.spotify, size: 35,), 
                          onPressed: () async  {
                            Uri url = Uri.parse(AudDBloc.state.songLink);
                            _launchUrl (url);
                          },
                        ),
                        IconButton(icon: FaIcon(FontAwesomeIcons.heart, size: 35,), onPressed: () {
                          FavBloc.add( SaveSongEvent(AudDBloc.state.song) );
                        },),
                        IconButton(icon: FaIcon(FontAwesomeIcons.apple, size: 35,), 
                          onPressed: () async  {
                            Uri url = Uri.parse(AudDBloc.state.songLink);
                            _launchUrl (url);
                          },
                        ),
                      ],
                    )
                  :
                  IconButton(icon: FaIcon(FontAwesomeIcons.arrowLeft, size: 35,), onPressed: () {
                    AudDBloc.add( StopListenEvent() );
                    Navigator.of(context).pop();
                  },),
                ],
            );
          },
        )
      ),
    );
  }

  Future <void> _launchUrl (Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
        return;
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print (e);
    }
  }
}
