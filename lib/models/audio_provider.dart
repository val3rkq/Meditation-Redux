import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  int _trackIndex = 0;
  int get trackIndex => _trackIndex;

  void changeTrack(int index) {
    _trackIndex = index;
    notifyListeners();
  }
}