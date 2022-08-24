import 'package:flutter/material.dart';

class Lives extends ChangeNotifier {
  int _Lives = 1;
  int get lives => _Lives;

  void ReduceLivesByOne() {
    _Lives--;
    notifyListeners();
  }

  void ResetLives() {
    _Lives = 5;
    notifyListeners();
  }
}
