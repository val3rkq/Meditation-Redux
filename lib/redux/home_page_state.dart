import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageState {
  final int initialTime;
  final int time;
  final bool? isPause;

  final int playingIndex;

  final Color background;

  // controllers
  final TextEditingController hoursController;
  final TextEditingController minutesController;
  final TextEditingController secondsController;

  final CarouselController carouselController;

  HomePageState({
    required this.background,
    required this.hoursController,
    required this.minutesController,
    required this.secondsController,
    required this.carouselController,
    required this.initialTime,
    required this.time,
    required this.playingIndex,
    required this.isPause,
  });
}
