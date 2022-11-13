import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesInitState()) {
    // on<FavoritesEvent>((event, emit) {
    //   // TODO: implement event handler
    // });

    on<IncCountEvent>((event, emit) {
      //Here you implement what you want to do
      print("Add working maybe");
      emit(FavSetState( event.newCount));
    });
  }
}
