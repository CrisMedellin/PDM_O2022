part of 'api_audd_bloc.dart';

@immutable
abstract class ApiAuddState {
  final String album;
  final String artist;
  final String date;
  final bool   found;
  final bool   glow;
  final String listen;
  final String picture;
  final String song;
  final String songLink;
  final String title;

  const ApiAuddState({
    this.album    =  "Unknown",
    this.artist   =  "Unknown",
    this.date     =  "Unknown",
    this.found    =  false,
    this.glow     =  true,
    this.listen   =  "Tap to listen",
    this.picture  =  "https://img.freepik.com/vector-gratis/ups-error-404-ilustracion-concepto-robot-roto_114360-5529.jpg?w=2000",
    this.song     =  "Unknown",
    this.songLink =  "",
    this.title    =  "Unknown"
  });
}

class ApiAuddInitState extends ApiAuddState {
  const ApiAuddInitState ():super (
    album     :  "Unknown",
    artist    :  "Unknown",
    date      :  "Unknown",
    found     :  false,
    glow      :  false,
    listen    :  "Tap to listen",
    picture   :  "https://img.freepik.com/vector-gratis/ups-error-404-ilustracion-concepto-robot-roto_114360-5529.jpg?w=2000",
    song      :  "Unknown",
    songLink  :  "",
    title     :  "Unknown"
  );
}

class UpdateSearch extends ApiAuddState {
  final String albumRes;
  final String artistRes;
  final String dateRes;
  final bool   foundRes;
  final String pictureRes;
  final String songRes;
  final String songLinkRes;
  final String titleRes;

  const UpdateSearch ({
    required this.albumRes,
    required this.artistRes,
    required this.dateRes,
    required this.foundRes,
    required this.pictureRes,
    required this.songRes,
    required this.songLinkRes,
    required this.titleRes,
  }):super (
    album     :  albumRes,
    artist    :  artistRes,
    date      :  dateRes,
    found     :  foundRes,
    glow      :  false,
    picture   :  pictureRes,
    song      :  songRes,
    songLink  :  songLinkRes,
    title     :  titleRes
  );
}

class ListeningState extends ApiAuddState {
    const ListeningState ():super ( listen:"Listening...", glow: true );
}

class StopListenState extends ApiAuddState {
    const StopListenState ():super ( listen:"Tap to listen", glow : false);
}