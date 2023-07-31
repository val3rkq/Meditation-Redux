import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/audio_item.dart';

Color transparent = Colors.transparent;
Color white7 = Colors.white.withOpacity(0.7);
Color white9 = Colors.white.withOpacity(0.9);
Color white = Colors.white;
Color grey2 = Colors.grey.withOpacity(0.2);
Color grey6 = Colors.grey.withOpacity(0.6);
Color grey = Colors.grey;
Color black2 = Colors.black.withOpacity(0.2);
Color black3 = Colors.black.withOpacity(0.38);
Color black8 = Colors.black.withOpacity(0.8);
Color black = Colors.black;
Color green = CupertinoColors.activeGreen;
const String hiveBoxName = '_BOX_';
final List<AudioItem> audioAssets = [
  AudioItem(
    name: 'Forest',
    audio: "assets/audio/forest.mp3",
    image: "assets/images/forest.jpeg",
  ),
  AudioItem(
    name: 'Thunderstorm',
    audio: "assets/audio/thunderstorm.mp3",
    image: "assets/images/thunderstorm.jpg",
  ),
  AudioItem(
    name: 'Ocean',
    audio: "assets/audio/ocean.mp3",
    image: "assets/images/ocean.jpg",
  ),
  AudioItem(
    name: 'Waterfall',
    audio: "assets/audio/waterfall.mp3",
    image: "assets/images/waterfall.jpeg",
  ),
  AudioItem(
    name: 'Wind',
    audio: "assets/audio/wind.mp3",
    image: "assets/images/wind.jpeg",
  ),
  AudioItem(
    name: 'Night',
    audio: "assets/audio/night.mp3",
    image: "assets/images/night.jpg",
  ),
];