import 'package:injectable/injectable.dart';
import '../../../../shared/util/util.dart';

import '../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../application.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends BaseBloc<HomeState> {
  final GetWeatherByCoordUseCase getWeatherByCoordUseCase;

  final GetWeatherForecastByCoordUseCase getWeatherForecastByCoordUseCase;

  final GetLocationUseCase getLocationUseCase;

  final RemoveLocationUseCase removeLocationUseCase;

  HomeBloc(
      {required this.getWeatherByCoordUseCase,
      required this.getLocationUseCase,
      required this.removeLocationUseCase,
      required this.getWeatherForecastByCoordUseCase})
      : super(const HomeState()) {
    eventBus.on<ReloadMyLocationListCommand>().listen((event) {
      init(selectFirst: false);
    });
    init();
  }

  Stream<WeatherEntity?> get weatherStream =>
      stream.map((state) => state.weather);

  Stream<List<WeatherEntity>?> get dailyForecastStream =>
      stream.map((state) => state.dailyForecast);

  Stream<List<WeatherEntity>?> get fiveDaysForecastStream =>
      stream.map((state) => state.fiveDaysForecast);

  Stream<List<MyLocationEntity>?> get locationsStream =>
      stream.map((state) => state.locations);

  void init({bool selectFirst = true}) {
    getMyLocations(selectFirst: selectFirst);
  }

  void getMyLocations({bool selectFirst = true}) async {
    final either = await getLocationUseCase.execute(NoParams());
    either.fold((l) {
      command = ErrorDialogCommand(l.errorMessage);
    }, (r) {
      emit(state.copyWith(locations: List.from(r)));
      if (r.isNotEmpty && selectFirst) {
        selectPlace(r.first);
      }
    });
  }

  void selectPlace(MyLocationEntity location) {
    state.clearWeather(selectedLocation: location);
    command = ShowLoadingCommand();
    getWeatherByCoordUseCase
        .execute(CoordinateParams(
            lat: location.location.latitude, lon: location.location.longitude))
        .then((either) {
      command = DismissLoadingCommand();
      either.fold((l) {
        command = ErrorDialogCommand(l.errorMessage);
      }, (r) {
        emit(state.copyWith(weather: r));
      });
    });

    getWeatherForecastByCoordUseCase
        .execute(CoordinateParams(
            lat: location.location.latitude, lon: location.location.longitude))
        .then((either) {
      command = DismissLoadingCommand();
      either.fold((l) {
        command = ErrorDialogCommand(l.errorMessage);
      }, (r) {
        emit(state.copyWith(dailyForecast: r));
        getDaysForecast(r);
      });
    });
  }

  void getDaysForecast(List<WeatherEntity> weathers) {
    List<WeatherEntity> dayList = [];
    for (var weather in weathers) {
      if (dayList.isEmpty ||
          dayList.indexWhere((element) =>
                  CommonUtil.getDaysFromSeconds(element.dt) ==
                  CommonUtil.getDaysFromSeconds(weather.dt)) ==
              -1) {
        dayList.add(weather);
      }
    }
    emit(state.copyWith(fiveDaysForecast: dayList));
  }

  void removeLocation(MyLocationEntity location) {
    command = ShowLoadingCommand();
    removeLocationUseCase.execute(location).then((either) {
      either.fold((l) {
        command = ErrorDialogCommand(l.errorMessage);
      }, (r) {
        init(selectFirst: location == state.selectedLocation);
      });
    });
  }
}
