import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fmbanger/service/top_artists_service_model.dart';
import 'package:provider/provider.dart';

class TopArtistsView extends StatelessWidget {
  const TopArtistsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TopArtistsServiceModel>(
      builder: (context, model, _) {
        if (model.isLoading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (model.hasError){
          return Center(child: Text("${model.error!.message!}"));
        } else {
          return GridView.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 20.0,
            padding: const EdgeInsets.only(top: 14.0),
            children: model.artists.map((artist){
              return CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(artist.getSmall),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
