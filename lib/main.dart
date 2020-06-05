import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/provider/indexNotifier.dart';
import 'package:superheroes/screens/home_screen.dart';
import 'package:superheroes/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}
