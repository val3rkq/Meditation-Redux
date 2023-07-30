// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "change_time" : MessageLookupByLibrary.simpleMessage("Change Time"),
    "done" : MessageLookupByLibrary.simpleMessage("Done"),
    "hours" : MessageLookupByLibrary.simpleMessage("Hours.."),
    "minutes" : MessageLookupByLibrary.simpleMessage("Minutes.."),
    "pause" : MessageLookupByLibrary.simpleMessage("PAUSE"),
    "restart" : MessageLookupByLibrary.simpleMessage("RESTART"),
    "resume" : MessageLookupByLibrary.simpleMessage("RESUME"),
    "seconds" : MessageLookupByLibrary.simpleMessage("Seconds.."),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "start" : MessageLookupByLibrary.simpleMessage("START"),
    "time_zero_error" : MessageLookupByLibrary.simpleMessage("Time can\'t be equal to zero!.."),
    "too_much_minutes" : MessageLookupByLibrary.simpleMessage("Too much minutes.."),
    "too_much_seconds" : MessageLookupByLibrary.simpleMessage("Too much seconds.."),
    "upload_is_not_available" : MessageLookupByLibrary.simpleMessage("Upload is under development now")
  };
}
