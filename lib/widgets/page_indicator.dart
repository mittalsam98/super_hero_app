import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superheroes/models/heroes.dart';
import 'package:superheroes/provider/indexNotifier.dart';

class PageIndicator extends StatelessWidget {
  _pageIndicator(bool isActive) {
    return Container(
      height: 11,
      width: 11,
      margin: EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.black : Colors.transparent,
        border: Border.all(
          width: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    print('In indicator before');
    final currentIndex = Provider.of<IndexNotifier>(context).index;
//    print('in indicator after $currentIndex');
    // ignore: missing_return
    List<Widget> _indicatorBuilder() {
      List<Widget> indicators = new List();

      for (int i = 0; i < heroes.length; i++) {
        indicators.add(
            i == currentIndex ? _pageIndicator(true) : _pageIndicator(false));
      }
      return indicators;
    }

    return Row(children: _indicatorBuilder());
  }
}
