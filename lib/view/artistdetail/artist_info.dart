import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fmbanger/config/constants.dart';
import 'package:fmbanger/models/artist.dart';
import 'package:fmbanger/repository/artist_info_repository.dart';

class ArtistDetailPage extends StatefulWidget {
  const ArtistDetailPage({
    Key? key,
    required this.artist,
  }) : super(key: key);

  final String artist;

  @override
  State<ArtistDetailPage> createState() => _ArtistDetailPageState();
}

class _ArtistDetailPageState extends State<ArtistDetailPage> {
  late Future<Artist> getArtistInfo;

  @override
  void initState() {
    getArtistInfo = ArtistInfoRepository.fetchArtistInfo(widget.artist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artist"),
      ),
      body: FutureBuilder<Artist>(
        future: getArtistInfo,
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

  buildPage(Artist artist) {
    final screenSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.2,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: CachedNetworkImage(
                          imageUrl: artist.getExtraLarge,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 36.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            artist.name!,
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const SizedBox(height: 12.0),
                          buildInfoTextSpan(
                              "Listeners: ", artist.stats!.listeners!),
                          buildInfoTextSpan(
                              "Play Count: ", artist.stats!.playcount!),
                          buildInfoTextSpan("Streamable: ", artist.streamable!),
                          buildInfoTextSpan("OnTour: ", artist.ontour!),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        text: "Released on ",
                        children: [
                          TextSpan(
                            text: artist.wiki!.published!,
                          )
                        ],
                        style: TextStyle(
                          color: Colors.white54,
                        ))),
                    const SizedBox(height: 18),
                    Text(
                      artist.wiki!.summary!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Text(
              "Similar artists",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Constants.primaryColor,
                fontSize: 18,
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: artist.similar!.artist!.length,
            itemBuilder: (context, index) {
              final author = artist.similar!.artist![index];
              return ListTile(
                leading: SizedBox(
                  width: 40,
                  child: CachedNetworkImage(
                    imageUrl: author.getSmall,
                  ),
                ),
                title: Text(author.name!),
              );
            },
          ),
        ),
      ],
    );
  }

  buildInfoTextSpan(String key, String value) {
    return Text.rich(TextSpan(
      text: key,
      children: [TextSpan(text: value)],
      style: TextStyle(
        color: Colors.white60,
        fontSize: 16,
      ),
    ));
  }
}
