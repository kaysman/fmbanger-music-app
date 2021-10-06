import 'dart:io';

import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/track.dart';

class TrackInfoRepository {

  static Future<Track> fetchTrackInfo(String name, String artist) async {

    final url = "method=track.getinfo&track=$name&artist=$artist";

    try {

      final response = await DioRequest().get(url);
      print(response);
      final result = Track.fromJson(response['track']);
      return result;
    }
    on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }

  }

}