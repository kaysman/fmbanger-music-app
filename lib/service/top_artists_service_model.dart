import 'package:flutter/cupertino.dart';
import 'package:fmbanger/config/dio_request.dart';
import 'package:fmbanger/models/artist.dart';
import 'package:fmbanger/repository/top_artists_repo.dart';

class TopArtistsServiceModel extends ChangeNotifier {
  bool isLoading = false;
  ErrorEntity? error;
  List<Artist> artists = [];

  TopArtistsServiceModel() {
    getTopArtists();
  }



  getTopArtists() async {
    isLoading = true;
    notifyListeners();

    try {
      final res = await TopArtistsRepository.fetchTopArtists();
      artists = res;
    } on ErrorEntity catch (e) {
      error = e;
    }

    isLoading = false;
    notifyListeners();
  }


  // getters
  bool get hasError => error != null;

}
