import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:meditation_fox/constants.dart';
import 'package:meditation_fox/generated/l10n.dart';
import 'package:meditation_fox/helpers/display_message.dart';
import 'package:meditation_fox/helpers/format_time.dart';
import 'package:meditation_fox/pages/home_page/widgets/for_home_screen/all.dart';
import 'package:meditation_fox/redux/actions.dart';
import 'package:meditation_fox/redux/home_page_state.dart';
import 'package:redux/redux.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'change_time_view.dart';
import 'player_view.dart';

final PanelController pc = PanelController();

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // get store and player from GetIt
  final Store store = GetIt.I<Store<HomePageState>>();
  final AudioPlayer audioPlayer = GetIt.I<AudioPlayer>();

  Timer? _timer;

  // key for controllers-validation
  final _formKey = GlobalKey<FormState>();

  void updateTime(BuildContext context, Store store) {
    if (_formKey.currentState!.validate()) {
      int hours = int.tryParse(store.state.hoursController.text) ?? 0;
      int minutes = int.tryParse(store.state.minutesController.text) ?? 0;
      int seconds = int.tryParse(store.state.secondsController.text) ?? 0;
      int timeSeconds = seconds + minutes * 60 + hours * 3600;
      if (timeSeconds != 0) {
        // we should restart timer
        restartTimer(store, context);
        // and then update initialTime
        store.dispatch(OnUpdateTimeTapAction(seconds: timeSeconds));
        Navigator.of(context).pop();
        store.dispatch(ClearControllersAction());
      } else {
        // error (time cannot be equal to 0)
        Navigator.of(context).pop();
        store.dispatch(ClearControllersAction());
        displayMessage(context, S.of(context).time_zero_error);
      }
    }
  }

  void startTimer(BuildContext context, bool isResume, Store store) async {
    if (!isResume) {
      await audioPlayer.setAsset(audioAssets[store.state.playingIndex].audio);
    }
    audioPlayer.play();
    store.dispatch(OnStartBtnTapAction());
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) async {
        store.dispatch(OnStartBtnTapAction());
        if (store.state.time <= 0) {
          showDialog(
            context: context,
            builder: (context) => AlertDialogDone(),
          );
          timer.cancel();

          await audioPlayer.stop();
          await audioPlayer.seek(const Duration(seconds: 0));

          store.dispatch(OnRestartBtnTapAction());
        }
      },
    );
  }

  void pauseTimer(Store store, BuildContext context) async {
    if (store.state.time != 0) {
      await audioPlayer.pause();
      store.dispatch(OnPauseBtnTapAction());
      if (_timer != null) {
        _timer!.cancel();
      }
    }
  }

  void restartTimer(Store store, BuildContext context) async {
    await audioPlayer.stop();
    await audioPlayer.seek(const Duration(seconds: 0));
    store.dispatch(OnRestartBtnTapAction());
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<HomePageState, HomePageState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return SlidingUpPanel(
            controller: pc,
            boxShadow: const [],
            minHeight: 50,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            onPanelOpened: () {
              store.dispatch(
                OnPanelOpened(
                  background: black3,
                ),
              );
            },
            onPanelClosed: () {
              store.dispatch(OnPanelOpened(background: transparent));
            },
            color: transparent,
            panel: PlayerView(
              onClose: () {
                if (pc.isAttached) {
                  pc.close();
                }
              },
            ),
            collapsed: GestureDetector(
              onTap: () {
                if (pc.isAttached) {
                  pc.open();
                }
              },
              child: Container(
                color: transparent,
                child: Icon(
                  Icons.keyboard_double_arrow_up_rounded,
                  size: 35,
                  color: white7,
                ),
              ),
            ),
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // background
                  Lottie.asset(
                    'assets/animations/background.json',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),

                  Container(
                    color: state.background,
                  ),

                  // content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),

                          // timer
                          GestureDetector(
                            onTap: () {
                              if (pc.isAttached) {
                                pc.close();
                              }
                              // show modal bottom sheet with time picker
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: transparent,
                                builder: (context) {
                                  return ChangeTimeView(
                                    updateTime: updateTime,
                                    formKey: _formKey,
                                  );
                                },
                              ).then((value) {
                                store.dispatch(ClearControllersAction());
                              });
                            },
                            child: Text(
                              formatTime(state.time),
                              style: TextStyle(
                                  fontSize: 75,
                                  fontWeight: FontWeight.w600,
                                  color: white9,
                                  letterSpacing: 0.1),
                            ),
                          ),

                          // lottie animation
                          const FoxWidget(),

                          const SizedBox(
                            height: 60,
                          ),

                          // buttons
                          state.isPause == null
                              ? MyButton(
                                  onTap: () {
                                    startTimer(context, false, store);
                                  },
                                  name: S.of(context).start,
                                  icon: null,
                                  isPause: state.isPause,
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyButton(
                                      onTap: () {
                                        if (state.isPause!) {
                                          startTimer(context, true, store);
                                        } else {
                                          pauseTimer(store, context);
                                        }
                                      },
                                      name: state.isPause!
                                          ? S.of(context).restart
                                          : S.of(context).pause,
                                      icon: state.isPause!
                                          ? Icons.play_arrow_rounded
                                          : Icons.pause_rounded,
                                      isPause: state.isPause,
                                    ),
                                    const SizedBox(width: 15),
                                    MyButton(
                                      onTap: () {
                                        restartTimer(store, context);
                                      },
                                      name: S.of(context).restart,
                                      icon: Icons.restart_alt_rounded,
                                      isPause: state.isPause,
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
