import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitState()) {
    // on<FavoritesEvent>((event, emit) {
    // });

    on<SaveSongEvent>((event, emit) {
      //Here you implement what you want to do
      print("Add working maybe");
      final toUpdate = state.favSongs;
      final songDecoded = jsonDecode(event.newSong);
      final newSong = {
        "album"     :  songDecoded['album'],
        "artist"    :  songDecoded['artist'],
        "date"      :  songDecoded['release_date'],
        "picture"   :  songDecoded['spotify']['album']['images'][0]['url'],
        "songLink"  :  songDecoded['song_link'].replaceAll('"', ''),
        "title"     :  songDecoded['title']
      };
      toUpdate.add(newSong);
      emit( UpdateFavState(toUpdate) );
      print("List of Favorites Songs");
      print(state.favSongs);
    });


    on<DeleteEvent>((event, emit) {
      final toUpdate = state.favSongs;
      toUpdate.removeWhere((element) => element['songLink'] == event.toDelete);

      emit ( UpdateFavState(toUpdate) );

    });


  }
}
