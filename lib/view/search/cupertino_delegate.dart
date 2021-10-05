import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'search_abstract.dart';

class CupertinoSearchDelegate extends AbstractPlatformSearchDelegate {
  final List<String> Function(String text) search;
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
    final List<String> result = search(query);
    return ListView.separated(
      itemCount: result.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(result[index]));
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.white24);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> result = search(query);
    return ListView.separated(
      itemCount: 1,
      itemBuilder: (context, index) {
        return ListTile(title: Text(result[index]));
      },
      separatorBuilder: (context, index) {
        return const Divider(color: Colors.white24);
      },
    );
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
          onPressed: () {
            setQuery = queryTextController.text;
            showResults(context);
          },
        ),
      ),
      child: Scaffold(body: body ?? Container()),
    );
  }
}
