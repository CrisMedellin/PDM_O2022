import 'package:bloc/bloc.dart';
import 'package:findtrackapp/pages/home_page.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitState()) {
    on<HomePageEvent>((event, emit) {
      emit( HomePageInitState() );
    });

    // on<ListenEvent>((event, emit) {
    //   emit(ListeningState());
    // });

    // on<StopListenEvent>((event, emit) {
    //   emit(StopListenState());

    // });

  }
}
