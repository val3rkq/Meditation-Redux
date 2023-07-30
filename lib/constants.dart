import 'package:flutter/material.dart';
import 'models/audio_item.dart';

Color backgroundColor = const Color(0xFF373740);
const String hiveBoxName = '_BOX';
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