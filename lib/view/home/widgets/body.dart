import 'package:flutter/material.dart';
import 'package:fmbanger/config/constants.dart';

import 'hit_tracks.dart';
import 'top_artists.dart';

class IndexBody extends StatelessWidget {
  const IndexBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            labelStyle: TextStyle(fontSize: 16.0),
            labelColor: Constants.primaryColor,
            unselectedLabelColor: Colors.white38,
            tabs: [
              Tab(icon: Text("Top artists")),
              Tab(icon: Text("Hit Tracks")),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TopArtistsView(),
                HitTracksView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
