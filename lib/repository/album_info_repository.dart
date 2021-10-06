import 'dart:io';

import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/album.dart';

class AlbumInfoRepository {

  static Future<Album> fetchAlbumInfo(String name, String artist) async {

    final url = "method=album.getinfo&album=$name&artist=$artist";

    try {

      final response = await DioRequest().get(url);
      final result = Album.fromJson(response['album']);
      return result;
    }
    on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }

  }

}