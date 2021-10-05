import 'package:flutter/material.dart';
import 'package:fmbanger/view/search/cupertino_delegate.dart';
import 'package:fmbanger/view/search/search_abstract.dart';

const double _headerIconSize = 38.0;
List<String> elements = List.generate(10, (index) => "Text$index");

class IndexHeader extends StatelessWidget {
  const IndexHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const FlutterLogo(size: _headerIconSize),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showPlatformSearch(
              context: context,
              delegate: CupertinoSearchDelegate(search),
            );
          },
          child: const Icon(Icons.search, size: _headerIconSize),
        ),
      ],
    );
  }

  List<String> search(String text) {
    return elements
        .where((element) => element.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
