import 'dart:io';
import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/artist.dart';

class TopArtistsRepository {
  static Future<List<Artist>> fetchTopArtists() async {
    /// it is just top 5 or 10 artists
    /// so we don't have to use pagination attributes here.

    final url = "limit=5&method=chart.gettopartists";

    try {
      final response = await DioRequest().get(url);
      print(response);
      final listOfArtists = (response["artists"]["artist"] as List)
          .map((json) => Artist.fromJson(json))
          .toList();
      return listOfArtists;
    } on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }
  }
}
