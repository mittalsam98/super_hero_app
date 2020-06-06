import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:superheroes/models/heroes.dart';
import 'package:superheroes/provider/offsetNotifier.dart';
import 'dart:math' as math;

class CaptainWidget extends StatefulWidget {
  @override
  _CaptainWidgetState createState() => _CaptainWidgetState();
}

class _CaptainWidgetState extends State<CaptainWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            double multiplier;
            if (notifier.page <= 1) {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 2).abs()),
              );
            }
            return Transform.translate(
              offset: Offset(0, -60 * (1 - multiplier)),
              child: Opacity(
                opacity: multiplier,
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
                  heroes[1].name,
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
            double multiplier;
            if (notifier.page <= 1) {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 2).abs()),
              );
            }
            return Transform.scale(
              scale: multiplier,
              child: child,
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
            double multiplier;
            if (notifier.page <= 1) {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 2).abs()),
              );
            }
            return Transform.scale(
              scale: multiplier,
              child: child,
            );
          },
          child: Align(
            alignment: Alignment(-0.2, 0),
            child: Image.asset(heroes[1].imagePath,
                height: MediaQuery.of(context).size.height * 0.45),
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
