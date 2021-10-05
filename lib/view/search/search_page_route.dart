

import 'package:flutter/widgets.dart';

import 'search_abstract.dart';
import 'search_widget.dart';

class SearchPageRoute<T> extends PageRoute<T> {

  SearchPageRoute({
    required this.delegate,
  }) {
    assert(
    delegate.route == null,
    'The ${delegate.runtimeType} instance is currently used by another active '
        'search. Please close that search by calling close() on the PlatformSearchDelegate '
        'before opening another search with the same delegate instance.',
    );
    delegate.route = this;
  }

  final AbstractPlatformSearchDelegate<T> delegate;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => false;

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
      ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  Animation<double> createAnimation() {
    final Animation<double> animation = super.createAnimation();
    delegate.proxyAnimation.parent = animation;
    return animation;
  }

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return PlatformSearchWidget<T>(
      delegate: delegate,
      animation: animation,
    );
  }

  @override
  void didComplete(T? result) {
    super.didComplete(result);
    assert(delegate.route == this);
    delegate.route = null;
    delegate.currentBody = null;
  }

}