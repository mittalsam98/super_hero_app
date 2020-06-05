import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PercentIndicator extends StatelessWidget {
  final String stats;
  final String statsName;
  final Color progressColor;
  PercentIndicator({this.stats, this.progressColor, this.statsName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xdd1D1E33),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 10.0,
              )
            ],
          ),
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 6.0,
            percent: int.parse(stats == 'null' ? '0' : stats) / 100,
            center: new Text(
              stats,
              style: TextStyle(color: Colors.white),
            ),
            animation: true,
            animationDuration: 1500,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Color(0xff1D1E33),
            progressColor: progressColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          statsName,
          style: TextStyle(fontStyle: FontStyle.italic),
        )
      ],
    );
  }
}
