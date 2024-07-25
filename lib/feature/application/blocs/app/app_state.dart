import 'dart:ui';
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final Locale? locale;

  AppState({
    AppState? state,
    Locale? locale,
  }) : locale = locale ?? state?.locale ?? const Locale('en');

  @override
  List<Object?> get props => [
        locale,
      ];
}
