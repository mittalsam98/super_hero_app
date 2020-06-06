import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:superheroes/provider/indexNotifier.dart';
import 'package:superheroes/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ChangeNotifierProvider<IndexNotifier>(
                  create: (context) {
                    return IndexNotifier();
                  },
                  child: Home()),
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff5f8fa),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Shimmer.fromColors(
                  baseColor: Color(0xddD02686),
                  highlightColor: Colors.deepPurple,
                  child: Center(
                    child: TyperAnimatedTextKit(
                      isRepeatingAnimation: false,
                      speed: Duration(milliseconds: 255),
                      text: ['SuperHeroes'],
                      textStyle: TextStyle(
                        fontSize: 41.0,
                        fontWeight: FontWeight.bold,
                        shadows: <Shadow>[
                          Shadow(blurRadius: 17, color: Colors.black87)
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
