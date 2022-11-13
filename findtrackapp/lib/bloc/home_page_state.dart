part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {
  final String listeningState;

  const HomePageState({
    this.listeningState    =  "Tap to listen"
  });
}

class HomePageInitState extends HomePageState {
    const HomePageInitState ():super ( listeningState:"Tap to listen" );
}

// class ListeningState extends HomePageState {
//     const ListeningState ():super ( listeningState:"Listening" );
// }

// class StopListenState extends HomePageState {
//     const StopListenState ():super ( listeningState:"Tap to listen" );
// }
