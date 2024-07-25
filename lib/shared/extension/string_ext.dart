import 'package:flutter/material.dart';

import '../shared.dart';

extension TextBuilderExtension on String {
  String shortenText({int limit = 23}) {
    return trim().length > limit
        ? '${trim().substring(0, limit - 3)}...'
        : this;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  Text text({TextStyle? style, TextWidgetConfig? config, Key? key}) => Text(
    this,
    key: key,
    style: style,
    maxLines: config?.maxLines,
    overflow: config?.overflow,
    textAlign: config?.textAlign,
    textDirection: config?.textDirection,
    locale: config?.locale,
    strutStyle: config?.strutStyle,
    softWrap: config?.softWrap,
    textWidthBasis: config?.textWidthBasis,
  );
}