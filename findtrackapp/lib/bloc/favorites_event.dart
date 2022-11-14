part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class IncCountEvent extends FavoritesEvent {
  final int newCount;
  IncCountEvent (this.newCount);
}

class SaveSongEvent extends FavoritesEvent {
  final String newSong;
  SaveSongEvent(this.newSong);
}


class DeleteEvent extends FavoritesEvent {
  final String toDelete;
  DeleteEvent (this.toDelete);
}