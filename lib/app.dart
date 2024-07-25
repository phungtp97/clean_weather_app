import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'core/core.dart';
import 'feature/application/application.dart';
import 'feature/application/blocs/home/home_bloc.dart';
import 'generated/l10n.dart';
import 'shared/resource/color.dart';
import 'shared/resource/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends BaseState<App, AppBloc> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Palette.primary.withOpacity(0.5)));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildApp();
  }

  Widget _buildApp({Locale? locale}) {
    return Consumer<AppTheme>(builder: (context, theme, child) {
      return MaterialApp(
        themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: (settings) => Routes.getRoute(settings),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: locale,
        navigatorObservers: const [],
      );
    });
  }
}