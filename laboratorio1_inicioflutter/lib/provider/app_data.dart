import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _counter = 0;

  List<String> _actions = [];

  int get counter => _counter;
  List<String> get actions => _actions;

  void incrementCounter() {
    _counter++;
    _actions.add('Incrementó el contador a $_counter');
    notifyListeners();
  }

  void reduceCounter() {
    _counter--;
    _actions.add('Redujo el contador a $_counter');
    notifyListeners();
  }

  void zeroCounter() {
    _counter = 0;
    _actions.add('Reinició el contador');
    notifyListeners();
  }

  void addAction(String action) {
    _actions.add(action);
    notifyListeners();
  }
}
