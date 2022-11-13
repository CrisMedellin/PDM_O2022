import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:record/record.dart';

import '../utils/secrets.dart';

part 'api_audd_event.dart';
part 'api_audd_state.dart';

class ApiAuddBloc extends Bloc<ApiAuddEvent, ApiAuddState> {
  ApiAuddBloc() : super(ApiAuddInitState()) {
    on<ApiAuddEvent>((event, emit) {
      emit (ApiAuddInitState());
    });

    on<MakeSearch>((event, emit) async {
      final record  = Record();
      final Uri url = Uri.parse('https://api.audd.io/');
      try {
        if ( await record.hasPermission()) {
          await record.start();
        }
        emit (ListeningState());
        await Future.delayed(Duration(seconds: 4));
        String? location = await record.stop();
        if (location == null) {
          emit(ApiAuddInitState());
        } else {
          
          File myRecord = File(location);
          Uint8List fileToParse = myRecord.readAsBytesSync();
          String encodedFile = base64Encode(fileToParse);

          Map<String, dynamic> reqParams = {
            'api_token' : AUDD_API_TOKEN,
            'audio' : encodedFile,
            // 'return' : 'spotify'
            // 'return' : 'apple_music'
            'return' : 'spotify, apple_music'
          };
          try {
            final apiResponse = await post(url, body: reqParams);
            final apiResBody = jsonDecode(apiResponse.body)['result'];
            if (apiResBody != null) {
              emit (
                UpdateSearch(
                  albumRes    : jsonEncode(apiResBody['album']),
                  artistRes   : jsonEncode(apiResBody['artist']),
                  dateRes     : jsonEncode(apiResBody['release_date']),
                  foundRes    : true,
                  pictureRes  : apiResBody['spotify']['album']['images'][0]['url'],
                  songRes     : jsonEncode(apiResBody),
                  songLinkRes : jsonEncode(apiResBody['song_link']),
                  titleRes    : jsonEncode(apiResBody['title'])
                )
              );
            }
          } catch (e) {
            print (e);
          }
        }
      } catch (e) {
        print(e);
      }
    });
 
    on<ListenEvent>((event, emit) {
      emit(ListeningState());
    });

    on<StopListenEvent>((event, emit) {
      emit(StopListenState());
    });

  }
}
