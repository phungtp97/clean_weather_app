import 'dart:convert';

import 'package:josh_weather/feature/domain/domain.dart';
import 'package:josh_weather/shared/constant/shared_preferences_key.dart';

import '../json_reader.dart';

List<MyLocationEntity> get fakeMyLocations => (json.decode(readJson('helper/fake_data/fake_my_locations.json'))[SharedPreferencesKey.placeMarksKey] as List<dynamic>).map((e) => MyLocationEntity.fromMap(e)).toList();
Map<String, dynamic> get fakeMyLocationJson => json.decode(readJson('helper/fake_data/fake_my_location.json'));
Map<String, dynamic> get fakeCurrentWeatherJson => json.decode(readJson('helper/fake_data/fake_current_weather.json'));
Map<String, dynamic> get fakeForecastJson => json.decode(readJson('helper/fake_data/fake_forecast.json'));