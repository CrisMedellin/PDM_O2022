part of 'api_audd_bloc.dart';

@immutable
abstract class ApiAuddEvent {}

class SetBasicsResults extends ApiAuddEvent {
  SetBasicsResults();
}

class MakeSearch extends ApiAuddEvent {
  MakeSearch();
}

class ListenEvent extends ApiAuddEvent {
  ListenEvent();
}

class StopListenEvent extends ApiAuddEvent {
  StopListenEvent();
}