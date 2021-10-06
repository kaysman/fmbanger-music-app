import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/models/album.dart';
import 'package:fmbanger/repository/album_info_repository.dart';
import 'package:fmbanger/view/trackdetail/track_info.dart';

class AlbumDetailPage extends StatefulWidget {
  const AlbumDetailPage({
    Key? key,
    required this.albumName,
    required this.artist,
  }) : super(key: key);

  final String albumName;
  final String artist;

  @override
  State<AlbumDetailPage> createState() => _AlbumDetailPageState();
}

class _AlbumDetailPageState extends State<AlbumDetailPage> {
  late Future<Album> getAlbumInfo;

  @override
  void initState() {
    getAlbumInfo =
        AlbumInfoRepository.fetchAlbumInfo(widget.albumName, widget.artist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album"),
      ),
      body: FutureBuilder<Album>(
        future: getAlbumInfo,
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

  buildPage(Album album) {
    final screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.6,
                width: double.infinity,
                child: CachedNetworkImage(
                    imageUrl: album.getExtraLarge, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(album.artist!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.white60,
                            )),
                    Spacer(),
                    Text.rich(TextSpan(
                      text: album.tracks!.track!.length.toString(),
                      children: [
                        TextSpan(text: " songs"),
                      ],
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white60,
                          ),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Text(
                  album.name!,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: album.tracks!.track!.length,
            itemBuilder: (context, index) {
              final track = album.tracks!.track![index];
              return GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TrackDetailPage(
                        trackName: track.name!,
                        artist: track.artist!.name!,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(track.name!),
                  subtitle: Text("Tap to see more"),
                  trailing: Icon(Icons.play_arrow),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
