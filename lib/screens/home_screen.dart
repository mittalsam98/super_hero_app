import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/json_parsing/Hero.dart';
import 'package:superheroes/provider/indexNotifier.dart';
import 'package:superheroes/provider/offsetNotifier.dart';
import 'package:superheroes/screens/details_screen.dart';
import 'package:superheroes/screens/search_screen.dart';
import 'package:superheroes/widgets/batman_widget.dart';
import 'package:superheroes/widgets/captain_widget.dart';
import 'package:superheroes/widgets/hulk_widget.dart';
import 'package:superheroes/widgets/iron_widget.dart';
import 'package:superheroes/widgets/page_indicator.dart';
import 'package:superheroes/widgets/spider_widget.dart';
import 'package:superheroes/widgets/superman_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _pageController;

  @override
  void initState() {
//    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OffsetNotifier>(
      create: (context) {
        return OffsetNotifier(_pageController);
      },
      child: Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          title: Text(
            'Search ',
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 3,
              color: Colors.black.withOpacity(0.8),
              shadows: <Shadow>[Shadow(color: Colors.black)],
              fontFamily: 'Cardo',
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 4),
              child: Container(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () async {
                    Result selectedResult = await showSearch(
                        context: context, delegate: HeroSearchDelegate());
                    if (selectedResult != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(results: selectedResult)),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      Provider.of<IndexNotifier>(context, listen: false).index =
                          index;
                    },
                    children: <Widget>[
                      IronManWidget(),
                      CaptainWidget(),
                      BatmanWidget(),
                      SpiderWidget(),
                      SupermanWidget(),
                      HulkWidget()
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[PageIndicator()],
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
