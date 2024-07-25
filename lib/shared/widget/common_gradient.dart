import 'package:flutter/material.dart';

import '../shared.dart';

class CommonGradient {
  static LinearGradient primary = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Palette.lightPrimary3,
      Palette.lightPrimary1,
      Palette.primary,
    ],
  );
}