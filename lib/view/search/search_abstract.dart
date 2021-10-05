import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fmbanger/config/enums.dart';

import 'search_page_route.dart';

Future<T?> showPlatformSearch<T>({
  required BuildContext context,
  required AbstractPlatformSearchDelegate<T> delegate,
  String? query = '',
}) {
  delegate.query = query ?? delegate.query;
  delegate.currentBody = SearchBody.suggestions;
  return Navigator.of(context).push(SearchPageRoute<T>(
    delegate: delegate,
  ));
}

abstract class AbstractPlatformSearchDelegate<T> {

  AbstractPlatformSearchDelegate({
    this.searchFieldLabel,
    this.searchFieldStyle,
    this.keyboardType,
  }) : assert(searchFieldStyle == null);

  Widget buildSuggestions(BuildContext context);
  Widget buildResults(BuildContext context);
  Widget buildScaffold(Widget? body, BuildContext context);

  String get query => queryTextController.text;
  set query(String value) {
    queryTextController.text = value;
  }

  Future<void> showResults(BuildContext context) async {
    focusNode?.unfocus();
    currentBody = SearchBody.results;
  }

  Future<void> showSuggestions(BuildContext context) async {
    assert(focusNode != null);
    focusNode!.requestFocus();
    currentBody = SearchBody.suggestions;
  }

  void close(BuildContext context, T result) {
    currentBody = null;
    focusNode?.unfocus();
    Navigator.of(context)
      ..popUntil((Route<dynamic> route) => route == route)
      ..pop(result);
  }

  final String? searchFieldLabel;
  final TextStyle? searchFieldStyle;
  final TextInputType? keyboardType;
  Animation<double> get transitionAnimation => proxyAnimation;
  FocusNode? focusNode;

  final TextEditingController queryTextController = TextEditingController();

  final ProxyAnimation proxyAnimation =
  ProxyAnimation(kAlwaysDismissedAnimation);

  final ValueNotifier<SearchBody?> currentBodyNotifier =
  ValueNotifier<SearchBody?>(null);

  SearchBody? get currentBody => currentBodyNotifier.value;
  set currentBody(SearchBody? value) {
    currentBodyNotifier.value = value;
  }

  SearchPageRoute<T>? route;

}



