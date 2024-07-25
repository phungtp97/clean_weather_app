import 'dart:ui';
import 'package:injectable/injectable.dart';

import '../../../../core/core.dart';
import '../../../../shared/shared.dart';
import '../../../application/application.dart';
import 'app.dart';

@singleton
class AppBloc extends BaseBloc<AppState> {
  final SetLocale _setLocaleUseCase;
  final GetLocale _getLocaleUseCase;
  final GetMe _getMeUseCase;

  AppBloc(
      {required SetLocale setLocaleUseCase,
      required GetLocale getLocaleUseCase,
      required GetMe getMeUseCase})
      : _setLocaleUseCase = setLocaleUseCase,
        _getLocaleUseCase = getLocaleUseCase,
        _getMeUseCase = getMeUseCase,
        super(AppState());

  @disposeMethod
  @override
  void dispose() {
    super.dispose();
  }

  Stream<Locale> get localeStream => stream
      .where((event) => event.locale != null)
      .map((event) => event.locale!)
      .distinct();

  Future<void> changeLanguage(String languageCode) async {
    await _setLocaleUseCase.execute(languageCode);
    emit(AppState(
      locale: LocaleBuilder.getLocale(languageCode),
      state: state,
    ));
  }

  LanguageEnum get currentLanguage {
    final String languageCode = _getLocaleUseCase.execute(NoParams()).fold(
          (l) => 'en',
          (r) => r.languageCode,
        );
    return LocaleBuilder.getLocaleEnum(languageCode);
  }
}
