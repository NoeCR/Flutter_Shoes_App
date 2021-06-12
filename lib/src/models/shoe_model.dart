import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _assetImage = 'assets/img/azul.png';
  double _size = 9.0;

  String get assetImage => this._assetImage;
  double get size => this._size;

  set assetImage(String url) {
    this._assetImage = url;
    notifyListeners();
  }

  set size(double size) {
    this._size = size;
    notifyListeners();
  }
}
