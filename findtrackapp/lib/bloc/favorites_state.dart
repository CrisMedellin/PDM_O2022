part of 'favorites_bloc.dart';

/**
 * Este documento sirve para asignar en el estado los valores que se reciban en cada uno de las clases, con sus respectivos métodos
 */

@immutable
abstract class FavoritesState {
  final int counter;

  const FavoritesState({this.counter = 0});
}

class FavoritesInitState extends FavoritesState{
  const FavoritesInitState():super (counter: 0);
}

class FavSetState extends FavoritesState{
  final int newCount;

  const FavSetState(this.newCount)
  :super (counter: newCount);
  
}
