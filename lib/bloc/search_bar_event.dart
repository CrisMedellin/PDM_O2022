part of 'search_bar_bloc.dart';

@immutable
abstract class SearchBarEvent {}

class MakeSearch extends SearchBarEvent {
  final String searchValue;

  MakeSearch (this.searchValue);

}
