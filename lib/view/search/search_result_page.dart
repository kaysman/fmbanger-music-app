import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/models/album.dart';
import 'package:fmbanger/view/albumdetail/album_detail.dart';

class SearchResultsPage extends StatefulWidget {
  const SearchResultsPage({
    Key? key,
    required this.search,
    required this.query,
  }) : super(key: key);

  final Future<List<Album>> Function(String text) search;
  final String query;

  @override
  State<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends State<SearchResultsPage> {
  late Future<List<Album>> _futureAlbums;

  @override
  void initState() {
    _futureAlbums = widget.search(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
      future: _futureAlbums,
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2.3,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 20.0,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final album = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => AlbumDetailPage(
                        albumName: album.name!,
                        artist: album.artist!,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: CachedNetworkImage(
                            imageUrl: album.getLarge,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          album.name!,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: Text(
                          album.artist!,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
