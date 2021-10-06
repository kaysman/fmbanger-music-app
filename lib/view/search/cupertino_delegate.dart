import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fmbanger/models/album.dart';

import 'search_abstract.dart';
import 'search_result_page.dart';

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
  Widget buildResults(BuildContext context) {
    return SearchResultsPage(
      search: search,
      query: query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: store previous search results at local data using sqflite
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
          placeholder: "Search album",
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
        body: body ?? Container(),
      ),
    );
  }
}
