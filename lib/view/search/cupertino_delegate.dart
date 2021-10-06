import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fmbanger/models/album.dart';

import 'search_abstract.dart';

class CupertinoSearchDelegate extends AbstractPlatformSearchDelegate {
  final Future<List<Album>> Function(String text) search;
  CupertinoSearchDelegate(this.search);

  Widget buildActions(BuildContext context) {
    return CupertinoButton(
      child: const Text('Cancel'),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context)  {
    return FutureBuilder<List<Album>>(
      future: search(query),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
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
            itemBuilder: (context, index){
              final album = snapshot.data![index];
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(album.name!),
                    Text(album.url!),
                  ],
                ),
              );
            },
          );
        }
      }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context)  {
    // final List<String> result = search(query);
    // return ListView.separated(
    //   itemCount: 1,
    //   itemBuilder: (context, index) {
    //     return ListTile(title: Text(result[index]));
    //   },
    //   separatorBuilder: (context, index) {
    //     return const Divider(color: Colors.white24);
    //   },
    // );
    return Container();
  }

  @override
  Widget buildScaffold(Widget? body, BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.black,
        transitionBetweenRoutes: true,
        leading: GestureDetector(
          onTap: () {
            close(context, null);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white54,
          ),
        ),
        middle: CupertinoSearchTextField(
          controller: queryTextController,
          focusNode: focusNode,
          style: const TextStyle(
            color: CupertinoColors.secondaryLabel,
          ),
        ),
        trailing: CupertinoButton(
          child: const Text('Search'),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          onPressed: () async {
            await showResults(context);
          },
        ),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Text("Artist"),
                  backgroundColor: Colors.grey.shade800,
                ),
                Chip(
                  label: Text("Album"),
                  backgroundColor: Colors.grey.shade800,
                ),
                Chip(
                  label: Text("Track"),
                  backgroundColor: Colors.grey.shade800,
                ),
              ],
            ),
            Expanded(
              child: body ?? Container(),
            ),
          ],
        ),
      ),
    );
  }
}
