import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:findtrackapp/bloc/favorites_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final FavBloc  = BlocProvider.of<FavoritesBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: 
      BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return 
          ListView.builder(
            itemCount: state.favSongs.length,
            itemBuilder: (BuildContext context, int index) {
              return 
                Padding(  
                  padding: EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          color: null,
                          onPressed: () async {
                           Uri url = Uri.parse(state.favSongs[index]['songLink']);
                            _launchUrl (url);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              state.favSongs[index]["picture"],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 17.5 / 20,
                            height: MediaQuery.of(context).size.width / 6,
                            decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )),
                            child: Column(
                              children: [
                                Text(
                                  state.favSongs[index]["title"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  state.favSongs[index]["artist"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          print("TODO: Add Deleating Function");
                          FavBloc.add( DeleteEvent(state.favSongs[index]['songLink']) );
                        }, 
                        icon: Icon(
                          Icons.heart_broken, 
                          color: Colors.purpleAccent, 
                          size: 40,
                        )
                      )
                    ],
                  ),
                );
            },
          );
        },
      )
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
