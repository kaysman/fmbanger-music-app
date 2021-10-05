import 'package:flutter/material.dart';

const double _headerIconSize = 38.0;

class IndexHeader extends StatelessWidget {
  const IndexHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        FlutterLogo(size: _headerIconSize),
        Spacer(),
        Icon(Icons.search, size: _headerIconSize),
      ],
    );
  }
}