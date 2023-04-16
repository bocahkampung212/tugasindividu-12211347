import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class dashboaradprovider with ChangeNotifier {
  int indextombol = 0;
  void saatdiklik(int index) {
    indextombol = index;
    notifyListeners();
  }
}
