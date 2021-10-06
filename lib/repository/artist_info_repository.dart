import 'dart:io';

import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/artist.dart';

class ArtistInfoRepository {

  static Future<Artist> fetchArtistInfo(String name) async {

    final url = "method=artist.getinfo&artist=$name";

    try {

      final response = await DioRequest().get(url);
      final result = Artist.fromJson(response['artist']);
      return result;
    }
    on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }

  }

}