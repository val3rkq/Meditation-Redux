// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `START`
  String get start {
    return Intl.message(
      'START',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `PAUSE`
  String get pause {
    return Intl.message(
      'PAUSE',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `RESUME`
  String get resume {
    return Intl.message(
      'RESUME',
      name: 'resume',
      desc: '',
      args: [],
    );
  }

  /// `RESTART`
  String get restart {
    return Intl.message(
      'RESTART',
      name: 'restart',
      desc: '',
      args: [],
    );
  }

  /// `Change Time`
  String get change_time {
    return Intl.message(
      'Change Time',
      name: 'change_time',
      desc: '',
      args: [],
    );
  }

  /// `Seconds..`
  String get seconds {
    return Intl.message(
      'Seconds..',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Too much seconds..`
  String get too_much_seconds {
    return Intl.message(
      'Too much seconds..',
      name: 'too_much_seconds',
      desc: '',
      args: [],
    );
  }

  /// `Minutes..`
  String get minutes {
    return Intl.message(
      'Minutes..',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Too much minutes..`
  String get too_much_minutes {
    return Intl.message(
      'Too much minutes..',
      name: 'too_much_minutes',
      desc: '',
      args: [],
    );
  }

  /// `Hours..`
  String get hours {
    return Intl.message(
      'Hours..',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Time can't be equal to zero!..`
  String get time_zero_error {
    return Intl.message(
      'Time can\'t be equal to zero!..',
      name: 'time_zero_error',
      desc: '',
      args: [],
    );
  }

  /// `Upload is under development now`
  String get upload_is_not_available {
    return Intl.message(
      'Upload is under development now',
      name: 'upload_is_not_available',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}