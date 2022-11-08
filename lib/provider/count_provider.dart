import 'package:flutter/foundation.dart';

class CountProvider with ChangeNotifier {
  int _counter = 50000;
  int get counter => _counter;
  
  void setCount() {
    if (_counter != 1) {
      _counter--;
    }

    notifyListeners();
  }
}
