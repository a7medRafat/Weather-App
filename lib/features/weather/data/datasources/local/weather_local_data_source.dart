import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/SevenWeatherModel.dart';

abstract class WeatherLocalDataSource {
  Future<Unit> cachesWeather(SevenWeatherModel weatherModel);

  Future<SevenWeatherModel> getCachedWeather();
}

class WeatherLocalDataSourceImpl extends WeatherLocalDataSource {
  final SharedPreferences sharedPreferences;

  WeatherLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachesWeather(SevenWeatherModel weatherModel) {
    final weatherModelToJson = weatherModel.toJson();
    sharedPreferences.setString(
        'CACHED_WEATHER', json.encode(weatherModelToJson));
    return Future.value(unit);
  }

  @override
  Future<SevenWeatherModel> getCachedWeather() {
    final jsonString = sharedPreferences.getString('CACHED_WEATHER');
    if (jsonString != null) {
      final decodeJson = json.decode(jsonString);
      final jsonToWeatherModel = SevenWeatherModel.fromJson(decodeJson);
      return Future.value(jsonToWeatherModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
