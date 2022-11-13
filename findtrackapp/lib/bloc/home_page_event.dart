part of 'home_page_bloc.dart';

@immutable
abstract class HomePageEvent {}


class LoadInitalValues extends HomePageEvent {
  LoadInitalValues();
}

// class ListenEvent extends HomePageEvent {
//   ListenEvent();
// }

// class StopListenEvent extends HomePageEvent {
//   StopListenEvent();
// }