
import 'package:flutter/material.dart';

class ClearControllersAction {}

class OnUpdateTimeTapAction {
  final int seconds;
  OnUpdateTimeTapAction({required this.seconds});
}

class OnStartBtnTapAction {}

class OnPauseBtnTapAction {}

class OnRestartBtnTapAction {}

class ChangeTrackAction {
  final int index;
  ChangeTrackAction({required this.index});
}

class OnPanelOpened {
  final Color background;
  OnPanelOpened({required this.background});
}