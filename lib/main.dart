import 'package:flutter/material.dart';
import 'component/unfocus.dart';
import 'config/constants.dart';
import 'view/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FmBanger App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff000000),
        indicatorColor: Constants.primaryColor,
      ),
      builder: (context, child) => Unfocus(child: child!),
      home: const IndexPage(),
    );
  }
}

