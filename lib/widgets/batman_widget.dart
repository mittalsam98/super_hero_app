import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:superheroes/models/heroes.dart';
import 'package:superheroes/provider/offsetNotifier.dart';
import 'dart:math' as math;

class BatmanWidget extends StatefulWidget {
  @override
  _BatmanWidgetState createState() => _BatmanWidgetState();
}

class _BatmanWidgetState extends State<BatmanWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Consumer<OffsetNotifier>(
          builder: (context, notifier, child) {
            double multiplier;
            if (notifier.page <= 2) {
              multiplier = math.max(
                0,
                math.max(0, (1 - notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 3).abs()),
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
                  heroes[2].name,
                  style: TextStyle(
                    fontSize: 30,
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
            if (notifier.page <= 2) {
              multiplier = math.max(
                0,
                math.max(0, (1 - notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 3).abs()),
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
            if (notifier.page <= 2) {
              multiplier = math.max(
                0,
                math.max(0, (1 - notifier.page).abs()),
              );
            } else {
              multiplier = math.max(
                0,
                math.max(0, (notifier.page - 3).abs()),
              );
            }
            return Transform.scale(
              scale: multiplier,
              child: child,
            );
          },
          child: Align(
            alignment: Alignment(-0.2, 0),
            child: Image.asset(heroes[2].imagePath,
                height: MediaQuery.of(context).size.height * 0.45),
          ),
        ),
      ],
    );
  }
}
