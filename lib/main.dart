import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import '../injectable.dart';
import 'app.dart';
import 'core/core.dart';
import 'feature/application/blocs/blocs.dart';
import 'generated/l10n.dart';
import 'shared/resource/color.dart';
import 'shared/resource/theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnv();
  await configureDependencies();
  runApp(ChangeNotifierProvider(
      create: (_) => AppTheme(false), child: const App()));
}

Future<void> loadEnv() async {
  String envFile = 'assets/env/.env';
  String flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'dev');

  switch (flavor) {
    case 'prod':
      envFile = 'assets/env/.env.prod';
      break;
    case 'staging':
      envFile = 'assets/env/.env.staging';
      break;
    case 'dev':
    default:
      envFile = 'assets/env/.env.dev';
      break;
  }

  await dotenv.load(fileName: envFile);
}
