import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'component/unfocus.dart';
import 'config/constants.dart';
import 'service/top_artists_service_model.dart';
import 'view/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => TopArtistsServiceModel())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FmBanger App',
      debugShowCheckedModeBanner: false,
      theme: Constants.darkTheme(),
      builder: (context, child) => Unfocus(child: child!),
      home: const HomePage(),
    );
  }
}
