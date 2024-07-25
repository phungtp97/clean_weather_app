import 'package:flutter/material.dart';

class TextWidgetConfig {
  final Key? key;
  final int? maxLines;

  final TextOverflow? overflow;

  final TextAlign? textAlign;

  final TextDirection? textDirection;

  final Locale? locale;

  final StrutStyle? strutStyle;

  final bool? softWrap;

  final TextWidthBasis? textWidthBasis;

  TextWidgetConfig(
      {this.key,
      this.maxLines,
      this.overflow,
      this.textAlign,
      this.textDirection,
      this.locale,
      this.strutStyle,
      this.softWrap,
      this.textWidthBasis});

  TextWidgetConfig copyWith({
    Key? key,
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    StrutStyle? strutStyle,
    bool? softWrap,
    TextWidthBasis? textWidthBasis,
  }) {
    return TextWidgetConfig(
      key: key ?? this.key,
      maxLines: maxLines ?? this.maxLines,
      overflow: overflow ?? this.overflow,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      strutStyle: strutStyle ?? this.strutStyle,
      softWrap: softWrap ?? this.softWrap,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
    );
  }

  factory TextWidgetConfig.h1({Key? key}) {
    return TextWidgetConfig(
      key: key,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      softWrap: true,
    );
  }

  factory TextWidgetConfig.overflow({Key? key}) {
    return TextWidgetConfig(
      key: key,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      softWrap: true,
    );
  }

  ///add setter class like builder pattern``
  TextWidgetConfig setMaxLines(int maxLines) {
    return copyWith(maxLines: maxLines);
  }

  TextWidgetConfig setOverflow(TextOverflow overflow) {
    return copyWith(overflow: overflow);
  }

  TextWidgetConfig setTextAlign(TextAlign textAlign) {
    return copyWith(textAlign: textAlign);
  }

  TextWidgetConfig setTextDirection(TextDirection textDirection) {
    return copyWith(textDirection: textDirection);
  }

  TextWidgetConfig setLocale(Locale locale) {
    return copyWith(locale: locale);
  }

  TextWidgetConfig setStrutStyle(StrutStyle strutStyle) {
    return copyWith(strutStyle: strutStyle);
  }

  TextWidgetConfig setSoftWrap(bool softWrap) {
    return copyWith(softWrap: softWrap);
  }

  TextWidgetConfig setTextWidthBasis(TextWidthBasis textWidthBasis) {
    return copyWith(textWidthBasis: textWidthBasis);
  }
}
