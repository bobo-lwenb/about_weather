// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
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
  String get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "aboutApp" : MessageLookupByLibrary.simpleMessage("About App"),
    "darkMode" : MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "developer" : MessageLookupByLibrary.simpleMessage("Developer: liu wenbo"),
    "english" : MessageLookupByLibrary.simpleMessage("English"),
    "followSystem" : MessageLookupByLibrary.simpleMessage("Follow System"),
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "lightMode" : MessageLookupByLibrary.simpleMessage("Light Mode"),
    "settings" : MessageLookupByLibrary.simpleMessage("Settings"),
    "simplifiedChinese" : MessageLookupByLibrary.simpleMessage("Simplified Chinese"),
    "systemLanguage" : MessageLookupByLibrary.simpleMessage("System Language"),
    "themeMode" : MessageLookupByLibrary.simpleMessage("Theme Model"),
    "todayInHistory" : MessageLookupByLibrary.simpleMessage("Today in History"),
    "todayInHistoryDesc" : MessageLookupByLibrary.simpleMessage("Show the events that happened today in history"),
    "welcome" : MessageLookupByLibrary.simpleMessage("Welcome")
  };
}
