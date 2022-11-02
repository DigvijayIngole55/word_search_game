import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EasySplashScreen(
        logo: Image.network("https://www.citypng.com/public/uploads/preview/download-blue-search-icon-button-png-11640084027s0fkuhz2lb.png"),
        title: Text("Welcome to search word"),
        navigator: HomePage(),
        durationInSeconds: 5,
      ),
    );
  }
}
