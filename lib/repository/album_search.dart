import 'dart:io';

import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/album.dart';

class AlbumSearchRepository {

  static Future<List<Album>> searchAlbum(String query) async {

    final url = "limit=15&method=album.search&album=$query";

    try {

      final response = await DioRequest().get(url);
      final results = (response['results']['albummatches']['album'] as List).map((json){
        return Album.fromJson(json);
      }).toList();
      return results;
    }
    on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }

  }

}