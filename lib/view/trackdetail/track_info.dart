import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fmbanger/config/constants.dart';
import 'package:fmbanger/models/track.dart';
import 'package:fmbanger/repository/track_info_repository.dart';

class TrackDetailPage extends StatefulWidget {
  const TrackDetailPage({
    Key? key,
    required this.trackName,
    required this.artist,
  }) : super(key: key);

  final String trackName;
  final String artist;

  @override
  State<TrackDetailPage> createState() => _TrackDetailPageState();
}

class _TrackDetailPageState extends State<TrackDetailPage> {
  late Future<Track> getTrackInfo;

  @override
  void initState() {
    getTrackInfo =
        TrackInfoRepository.fetchTrackInfo(widget.trackName, widget.artist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track"),
      ),
      body: FutureBuilder<Track>(
        future: getTrackInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error!.toString()),
            );
          } else {
            return buildPage(snapshot.data!);
          }
        },
      ),
    );
  }

  buildPage(Track track) {
    final screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 28.0,
              horizontal: 14.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: InfoLabel(
                      type: "Song",
                      value: track.name!,
                    ),),
                    Expanded(child: InfoLabel(
                      type: "Listeners",
                      value: track.name!,
                    ),),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(child: InfoLabel(
                      type: "Play Count",
                      value: track.playcount!,
                    ),),
                    Expanded(child: InfoLabel(
                      type: "Artist",
                      value: track.artist!.name!,
                    ),),
                  ],
                ),
                const SizedBox(height: 18),
                Text.rich(
                  TextSpan(
                    text: "Released on ",
                    children: [
                      TextSpan(
                        text: track.wiki!.published!,
                      )
                    ],
                    style: TextStyle(
                      color: Colors.white54,
                    )
                  )
                ),
                const SizedBox(height: 18),
                Text(track.wiki!.summary!, style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.9),
                ),),
                const SizedBox(height: 18),
                Text(track.wiki!.content!),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class InfoLabel extends StatelessWidget {
  const InfoLabel({Key? key,
    required this.value, required this.type,
  }) : super(key: key);

  final String type;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("$type: ", style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500,
          color: Colors.white54,
        )),
        const SizedBox(height: 8.0),
        Text(value, style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500,
          color: Constants.primaryColor,
        ),),
      ],
    );
  }
}
