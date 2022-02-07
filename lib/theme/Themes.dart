import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.blue,
    dividerColor: Colors.black12,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black45,
    dividerColor: Colors.black.withOpacity(0.4),
  );
}
