import 'package:flutter/material.dart';
import 'package:fmbanger/config/enums.dart';

import 'search_abstract.dart';


class PlatformSearchWidget<T> extends StatefulWidget {

  const PlatformSearchWidget({
    required this.delegate,
    this.animation,
  });

  final AbstractPlatformSearchDelegate<T> delegate;
  final Animation<double>? animation;

  @override
  State<StatefulWidget> createState() => _PlatformSearchWidgetState<T>();

}

class _PlatformSearchWidgetState<T> extends State<PlatformSearchWidget<T>> {

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.animation?.addStatusListener(_onAnimationStatusChanged);
    widget.delegate.currentBodyNotifier.addListener(_onSearchBodyChanged);
    focusNode.addListener(_onFocusChanged);
    widget.delegate.focusNode = focusNode;
  }

  @override
  void dispose() {
    super.dispose();
    widget.animation?.removeStatusListener(_onAnimationStatusChanged);
    widget.delegate.currentBodyNotifier.removeListener(_onSearchBodyChanged);
    widget.delegate.focusNode = null;
    focusNode.dispose();
  }

  void _onAnimationStatusChanged(AnimationStatus status) {
    if (status != AnimationStatus.completed) {
      return;
    }
    widget.animation?.removeStatusListener(_onAnimationStatusChanged);
    if (widget.delegate.currentBody == SearchBody.suggestions) {
      focusNode.requestFocus();
    }
  }

  @override
  void didUpdateWidget(PlatformSearchWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.delegate != oldWidget.delegate) {
      oldWidget.delegate.currentBodyNotifier
          .removeListener(_onSearchBodyChanged);
      widget.delegate.currentBodyNotifier.addListener(_onSearchBodyChanged);
      oldWidget.delegate.focusNode = null;
      widget.delegate.focusNode = focusNode;
    }
  }

  void _onFocusChanged() {
    if (focusNode.hasFocus &&
        widget.delegate.currentBody != SearchBody.suggestions) {
      widget.delegate.showSuggestions(context);
    }
  }

  void _onSearchBodyChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget? body;
    switch (widget.delegate.currentBody) {
      case SearchBody.suggestions:
        body = KeyedSubtree(
          key: const ValueKey<SearchBody>(SearchBody.suggestions),
          child: widget.delegate.buildSuggestions(context),
        );
        break;
      case SearchBody.results:
        body = KeyedSubtree(
          key: const ValueKey<SearchBody>(SearchBody.results),
          child: widget.delegate.buildResults(context),
        );
        break;
      case null:
        break;
    }

    return widget.delegate.buildScaffold(body, context);
  }

}
