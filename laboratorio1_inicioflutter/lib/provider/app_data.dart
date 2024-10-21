import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  List<String> _actions = [];

  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void reduceCounter() {
    _counter--;
    notifyListeners();
  }

  void zeroCounter() {
    _counter = 0;
    notifyListeners();
  }

  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
}
