import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_bar_event.dart';
part 'search_bar_state.dart';

class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {


  SearchBarBloc() : super(SearchBarState());

  // @override
  Stream <SearchBarState> mapEventToState (
    SearchBarEvent event,
  ) async* {

      //   var url = Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': state.search});
      //   var response = await http.get(url);

     
      // yield SearchBarState(
      //   search: event.searchValue,
      //   searchLen: "${jsonDecode(response.body)['items'].length}",
      //   bookArr: jsonEncode(jsonDecode(response.body)['items']),
      //   // bookToShare: '{}',
      //   // currentBook: '{}'
      // );

  }


}
