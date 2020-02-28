import 'dart:async';

import 'package:flutter/material.dart';

class ThemeManager {
   StreamController<ThemeData> themeController = StreamController<ThemeData>();

  Stream<ThemeData> get theme => themeController.stream;


Future changeTheme(ThemeData themeToApply) async {

  // Broadcast new theme
  themeController.add(themeToApply);
}

}