import 'dart:io';
import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/track.dart';

class HitTracksRepository {
  static Future<List<Track>> fetchHitTracks() async {
    /// in the opening of the app user just needs to see
    /// couple of hit tracks, then with "see more" button
    /// he/she can see list of tracks. So, here we just need
    /// 5 to 10 tracks.
    final limit = 6;
    final url = "limit=$limit&method=chart.gettoptracks";

    try {
      final response = await DioRequest().get(url);
      final list = (response["tracks"]["track"] as List)
          .map((json) => Track.fromJson(json))
          .toList();
      return list;
    } on ErrorEntity catch (e) {
      throw e;
    } on SocketException {
      throw ErrorEntity(message: "Network Issue");
    }
  }
}
