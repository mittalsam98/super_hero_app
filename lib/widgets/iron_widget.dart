import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/models/heroes.dart';
import 'package:superheroes/provider/offsetNotifier.dart';
import 'dart:math' as math;

class IronManWidget extends StatefulWidget {
  @override
  _IronManWidgetState createState() => _IronManWidgetState();
}

class _IronManWidgetState extends State<IronManWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Transform.translate(
              offset: Offset(
                  0,
                  -60 *
                      (1 -
                          math.max(
                            0,
                            math.max(0, (1 - notifier.page)),
                          ))),
              child: Opacity(
                opacity: math.max(
                  0,
                  math.max(0, (1 - notifier.page)),
                ),
                child: child,
              ),
            );
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Shimmer.fromColors(
                baseColor: Colors.black,
                highlightColor: Colors.black54,
                child: Text(
                  heroes[0].name,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Cardo',
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Transform.scale(
              scale: math.max(
                0,
                math.max(0, (1 - notifier.page)),
              ),
              child: Opacity(
                  opacity: math.max(
                    0,
                    math.max(
                      0,
                      (1 - notifier.page),
                    ),
                  ),
                  child: child),
            );
          },
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            return Transform.scale(
              scale: math.max(
                0,
                math.max(0, (1 - notifier.page)),
              ),
              child: child,
            );
          },
          child: Align(
            alignment: Alignment(-0.2, 0),
            child: Image.asset(heroes[0].imagePath,
                height: MediaQuery.of(context).size.height * 0.50),
          ),
        ),
      ],
    );
  }
}

//AnimatedBuilder(
//animation: animation,
//builder: (context, child) {
//return Transform.scale(
//scale: animation.value * 0.8,
//child: Align(
//alignment: Alignment(-0.2, 0),
//child: Image.asset('assets/images/ironman.png',
//height: MediaQuery.of(context).size.height * 0.55),
//),
//);
//},
//),
