import 'package:hive_flutter/hive_flutter.dart';
import 'package:meditation_fox/constants.dart';

// Hive DATABASE (for some settings)
class DB {
  var box = Hive.box(hiveBoxName);
  late int initialTime;
  int? playingIndex;

  void initData() {
    // default meditation time = 10 minutes
    initialTime = 600;
    // default index = 0
    playingIndex = 0;
  }

  void getData() {
    initialTime = box.get('INITIAL_TIME');
    playingIndex = box.get('PLAYING_INDEX');
  }

  void updateDB({required int newInitialTime, required int playingIndex}) {
    box.put('INITIAL_TIME', newInitialTime);
    box.put('PLAYING_INDEX', playingIndex);
  }
}