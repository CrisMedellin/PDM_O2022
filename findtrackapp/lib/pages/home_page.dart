
//External Imports
// import 'dart:io';
import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:findtrackapp/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//My imports
// import 'package:findtrackapp/bloc/home_page_bloc.dart';
import 'package:findtrackapp/bloc/api_audd_bloc.dart';
// import 'package:findtrackapp/bloc/favorites_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final AudDBloc = BlocProvider.of<ApiAuddBloc>(context, listen: false);
    // final FavBloc  = BlocProvider.of<FavoritesBloc>(context, listen: false);
    // final HomeBloc  = BlocProvider.of<HomePageBloc>(context, listen: false);

    return Scaffold(
      body: 
        BlocBuilder<ApiAuddBloc, ApiAuddState>(
          builder: (context, state) {
            return 
              Container (
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceAround,          
                  children: [
                    Text ("${state.listen}", style: TextStyle (fontSize: 20),),
                    // Text (RecProv.Listen, style: TextStyle (fontSize: 20),),
                    AvatarGlow(
                      animate: AudDBloc.state.glow,
                      glowColor: Colors.deepPurpleAccent,
                      endRadius: 170,
                      // duration: Duration(milliseconds:3000),
                      child: MaterialButton (
                        onPressed: () async {
                        // onPressed: () {
                          // AudDBloc.add( ListenEvent() );
                          AudDBloc.add( MakeSearch() );
                          await Future.delayed(Duration(seconds: 5));
                          Navigator.of(context).pushNamed("/search_results");
                        },
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: 
                        CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          radius: 90,
                          // backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/thumbnails/006/559/143/small_2x/music-note-logo-template-free-vector.jpg"),
                          // backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOurE0ulaHnbFEoUOctDbUbaMT7PjrRds4bQ&usqp=CAU"),
                          backgroundImage: NetworkImage("https://i.pinimg.com/736x/2b/8d/45/2b8d45b1659fa2a00639ed4e7de509a7.jpg"),
                        ),
                      ),
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          // IconButton(
                          //   icon: FaIcon (FontAwesomeIcons.heart, size: 35,), 
                          //   onPressed: () {
                          //     Navigator.of(context).pushNamed("/favorites");
                          //   }, 
                          // ),
                          // IconButton(
                          //   icon: FaIcon (FontAwesomeIcons.powerOff, size: 35,), 
                          //   onPressed: () {
                          //     // Navigator.of(context).pushNamed("/login");
                          //     Navigator.of(context).pushNamed("/logout");
                          //   }, 
                          // ),
                          MaterialButton(
                            child: 
                              FaIcon (FontAwesomeIcons.heart, size: 35,), 
                            onPressed: () {
                              // Navigator.of(context).pushNamed("/login");
                              Navigator.of(context).pushNamed("/favorites");
                            }, 
                          ),
                          MaterialButton(
                            child: 
                              FaIcon (FontAwesomeIcons.powerOff, size: 35,), 
                            onPressed: () {
                              // Navigator.of(context).pushNamed("/login");
                              Navigator.of(context).pushNamed("/logout");
                            }, 
                          )
                      ],
                    ),
                  
                  ],
                ),
              );
          },
      ),
    );
  }
}
