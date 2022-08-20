import 'package:flutter/material.dart';

enum PageTypes { intro, levels, game }

class PageProvider with ChangeNotifier {
  PageTypes _currentPage = PageTypes.intro;

  PageTypes get currentPage {
    return _currentPage;
  }

  bool _isPlaying = true;
  bool get isPlaying => _isPlaying;

  void reversePlaying() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void changeCurrentPage(PageTypes newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
