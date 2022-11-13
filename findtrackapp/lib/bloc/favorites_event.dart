part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class IncCountEvent extends FavoritesEvent {
  final int newCount;
  IncCountEvent (this.newCount);
}

class Delete extends FavoritesEvent {
  Delete ();
}