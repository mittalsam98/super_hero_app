import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:superheroes/json_parsing/Hero.dart';
import 'package:superheroes/widgets/circular_percent.dart';

class DetailScreen extends StatefulWidget {
  final Result results;
  DetailScreen({this.results});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 280,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.results.image.url),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(.2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 12, top: 32),
                          child: IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    widget.results.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    widget.results.biography.fullName,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Color(0xffE71922),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                widget.results.biography.publisher,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Powerstats',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 14,
                    shrinkWrap: true,
                    children: <Widget>[
                      PercentIndicator(
                        stats: widget.results.powerstats.intelligence,
                        progressColor: Color(0xffffffff),
                        statsName: 'Intelligence',
                      ),
                      PercentIndicator(
                        stats: widget.results.powerstats.strength,
                        progressColor: Color(0xffffffff),
                        statsName: 'Strength',
                      ),
                      PercentIndicator(
                        stats: widget.results.powerstats.speed,
                        progressColor: Color(0xffffffff),
                        statsName: 'Speed',
                      ),
                      PercentIndicator(
                        stats: widget.results.powerstats.durability,
                        progressColor: Color(0xffffffff),
                        statsName: 'Durability',
                      ),
                      PercentIndicator(
                        stats: widget.results.powerstats.power,
                        progressColor: Color(0xffffffff),
                        statsName: 'Power',
                      ),
                      PercentIndicator(
                        stats: widget.results.powerstats.combat,
                        progressColor: Color(0xffffffff),
                        statsName: 'Combat',
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
