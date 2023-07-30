import 'package:flutter/material.dart';
import 'package:meditation_fox/database/db.dart';
import 'home_page_state.dart';
import 'actions.dart';

HomePageState reducer(HomePageState state, dynamic action) {
  return HomePageState(
    background: backgroundReducer(state, action),
    playingIndex: changeCurrentTrackReducer(state, action),
    initialTime: updateInitialTimeReducer(state, action),
    time: state.isPause == null ? updateInitialTimeReducer(state, action) : timerReducer(state, action)[0],
    isPause: timerReducer(state, action)[1],
    secondsController: clearControllerReducer(state, action) ?? state.secondsController,
    minutesController: clearControllerReducer(state, action) ?? state.minutesController,
    hoursController: clearControllerReducer(state, action) ?? state.hoursController,
    carouselController: state.carouselController,
  );
}

// current track reducer
int changeCurrentTrackReducer(HomePageState state, dynamic action) {
  if (action is ChangeTrackAction) {
    state.carouselController.animateToPage(
      action.index,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 350),
    );
    DB db = DB();
    // update playing index in Database
    db.updateDB(
      newInitialTime: state.initialTime,
      playingIndex: action.index,
    );
    return action.index;
  }
  return state.playingIndex;
}

// timer reducer
List<dynamic> timerReducer(HomePageState state, dynamic action) {
  if (action is OnStartBtnTapAction) {
    return [state.time - 1, false];
  } else if (action is OnPauseBtnTapAction) {
    return [state.time, true];
  } else if (action is OnRestartBtnTapAction) {
    return [state.initialTime, null];
  }
  return [state.time, state.isPause];
}

// clear controller reducer
TextEditingController? clearControllerReducer(HomePageState state, dynamic action) {
  if (action is ClearControllersAction) {
    return TextEditingController(text: '');
  }
  return null;
}

// update time reducer
int updateInitialTimeReducer(HomePageState state, dynamic action) {
  if (action is OnUpdateTimeTapAction) {
    DB db = DB();
    // update initial time in Database
    db.updateDB(newInitialTime: action.seconds, playingIndex: state.playingIndex);
    return action.seconds;
  }
  return state.initialTime;
}

// change background reducer
Color backgroundReducer(HomePageState state, dynamic action) {
  if (action is OnPanelOpened) {
    return action.background;
  }
  return state.background;
}