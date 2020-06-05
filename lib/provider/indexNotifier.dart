import 'package:flutter/cupertino.dart';

class IndexNotifier with ChangeNotifier {
  int _index = 0;

  int get index {
//    print('in getter index $_index');
    return _index;
  }

  set index(int index) {
//    print('in setter index $index $_index');
    _index = index;
    notifyListeners();
  }
}
