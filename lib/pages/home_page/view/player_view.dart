import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/database/db.dart';
import 'package:meditation_fox/pages/home_page/widgets/for_player_view/all.dart';
import 'package:meditation_fox/pages/settings_page/view/settings_screen.dart';
import 'package:meditation_fox/redux/actions.dart';
import 'package:meditation_fox/redux/home_page_state.dart';
import 'package:redux/redux.dart';

class PlayerView extends StatelessWidget {
  PlayerView({super.key, required this.onClose});

  final void Function()? onClose;

  final Store store = GetIt.I<Store<HomePageState>>();
  final AudioPlayer audioPlayer = GetIt.I<AudioPlayer>();

  // init Database
  DB db = DB();

  void setNewTrack(index) async {
    store.dispatch(ChangeTrackAction(index: index));
    await audioPlayer.setAsset(audioAssets[index].audio);
  }

  @override
  Widget build(BuildContext context) {
    db.getData();
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        height: MediaQuery.of(context).size.height * 0.9,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.transparent,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: Colors.black.withOpacity(0),
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onClose,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
            actions: [
              // settings
              GestureDetector(
                onTap: () {
                  // go settings page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.settings_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),

              // upload track
              GestureDetector(
                onTap: () {
                  // TODO: upload own track
                },
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.upload_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          body: StoreConnector<HomePageState, HomePageState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CarouselSlider(
                      carouselController: state.carouselController,
                      items: List.generate(
                          audioAssets.length, (index) => CarouselItem(index)),
                      options: CarouselOptions(
                        initialPage: db.playingIndex ?? 0,
                        height: MediaQuery.of(context).size.height,
                        pageSnapping: true,
                        aspectRatio: 8 / 8,
                        onPageChanged: (value, read) {
                          setNewTrack(value);
                        },
                        viewportFraction: 1,
                        enlargeFactor: 0,
                        autoPlay: false,
                        enlargeCenterPage: true,
                      ),
                    ),
                    Buttons(
                      onNextTrack: () {
                        int newIndex = state.playingIndex + 1;
                        if (newIndex == audioAssets.length) {
                          newIndex = 0;
                        }
                        setNewTrack(newIndex);
                      },
                      onPreviousTrack: () {
                        int newIndex = state.playingIndex - 1;
                        if (newIndex == -1) {
                          newIndex = audioAssets.length - 1;
                        }
                        setNewTrack(newIndex);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}