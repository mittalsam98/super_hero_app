import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
      Duration(seconds: 5),
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff5f8fa),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Opacity(
                    opacity: 0.9,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.black87,
                  highlightColor: Color(0xffC1A050),
                  child: Center(
                    child: TyperAnimatedTextKit(
                      isRepeatingAnimation: false,
                      speed: Duration(milliseconds: 300),
                      text: ['SuperHeroes'],
                      textStyle: TextStyle(
                        fontSize: 41.0,
                        fontFamily: 'Cardo',
                        fontWeight: FontWeight.bold,
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
