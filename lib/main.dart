import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/redux/home_page_state.dart';
import 'package:redux/redux.dart';

import 'database/db.dart';
import 'my_app.dart';
import 'redux/reducers.dart';

void main() async {
  late int initialTime;
  late int playingIndex;

  // init Hive
  await Hive.initFlutter();
  var box = await Hive.openBox(hiveBoxName).then((value) {
    // init database model
    DB db = DB();
    // get data from Hive DB
    if (value.get('INITIAL_TIME') == null) {
      db.initData();
    } else {
      db.getData();
    }
    initialTime = db.initialTime;
    playingIndex = db.playingIndex!;
  });

  // init REDUX
  final Store<HomePageState> store = Store(
    reducer,
    initialState: HomePageState(
      background: transparent,
      playingIndex: playingIndex,
      initialTime: initialTime,
      time: initialTime,
      isPause: null,
      hoursController: TextEditingController(),
      minutesController: TextEditingController(),
      secondsController: TextEditingController(),
      carouselController: CarouselController(),
    ),
  );
  GetIt.I.registerSingleton<Store<HomePageState>>(store);

  // init audio player
  final AudioPlayer audioPlayer = AudioPlayer()..setLoopMode(LoopMode.one);
  GetIt.I.registerSingleton<AudioPlayer>(audioPlayer);

  runApp(
    StoreProvider<HomePageState>(
      store: store,
      child: const MyApp(),
    ),
  );
}
