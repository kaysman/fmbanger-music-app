import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/service/hit_tracks_service_model.dart';
import 'package:fmbanger/view/trackdetail/track_info.dart';
import 'package:provider/provider.dart';

class HitTracksView extends StatelessWidget {
  const HitTracksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HitTracksServiceModel>(
      builder: (context, model, _) {
        if (model.isLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (model.hasError) {
          return Center(child: Text("${model.error!.message!}"));
        } else {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: model.tracks.length,
            padding: const EdgeInsets.only(top: 14.0),
            itemBuilder: (context, index) {
              final track = model.tracks[index];
              return InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => TrackDetailPage(
                        trackName: track.name!,
                        artist: track.artist!.name!,
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: ListTile(
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network(
                      track.getMedium,
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(track.name!),
                  subtitle: Text(track.artist!.name!),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: Colors.white60,
                        size: 18,
                      ),
                      Text(
                        track.listeners!,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider(color: Colors.white38);
            },
          );
        }
      },
    );
  }
}
