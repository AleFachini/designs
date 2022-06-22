import 'package:designs/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget value) {
    _currentPage = value;
    notifyListeners();
  }
}
