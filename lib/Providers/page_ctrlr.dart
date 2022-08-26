import 'package:flutter/material.dart';

enum PageTypes { intro, levels, game }

class PageProvider with ChangeNotifier {
  PageTypes _currentPage = PageTypes.intro;

  PageTypes get currentPage {
    return _currentPage;
  }

  bool _isPlaying = true;
  bool get isPlaying => _isPlaying;

  bool _isContact = false;
  bool get isContact => _isContact;

  void reverseContact() {
    _isContact = !_isContact;
    notifyListeners();
  }

  void reversePlaying() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void changeCurrentPage(PageTypes newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
