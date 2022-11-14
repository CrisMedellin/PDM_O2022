part of 'favorites_bloc.dart';

/**
 * Este documento sirve para asignar en el estado los valores que se reciban en cada uno de las clases, con sus respectivos métodos
 */

@immutable
abstract class FavoritesState {
  final List favSongs;

  FavoritesState({
    this.favSongs = const []
  });
}

class FavoritesInitState extends FavoritesState {
  FavoritesInitState ():super (
    favSongs   :  []
  );
}

class UpdateFavState extends FavoritesState {
  UpdateFavState (List newFavs):super (
    favSongs   :  newFavs
  );
}