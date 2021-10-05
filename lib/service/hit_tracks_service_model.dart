import 'package:flutter/cupertino.dart';
import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/track.dart';
import 'package:fmbanger/repository/hit_tracks_repo.dart';

class HitTracksServiceModel extends ChangeNotifier {
  bool isLoading = false;
  ErrorEntity? error;
  List<Track> tracks = [];

  HitTracksServiceModel() {
    getHitTracks();
  }



  getHitTracks() async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await HitTracksRepository.fetchHitTracks();
      tracks = res;
    } on ErrorEntity catch (e) {
      error = e;
    }

    isLoading = false;
    notifyListeners();
  }


  // getters
  bool get hasError => error != null;

}
