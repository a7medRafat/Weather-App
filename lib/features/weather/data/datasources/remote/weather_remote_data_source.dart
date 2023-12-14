import 'dart:convert';
import 'package:weatherapp/core/errors/failures.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../models/SevenWeatherModel.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<SevenWeatherModel> getWeather(String cityName);
}

String BASE_URL = "http://api.weatherapi.com/v1";
const String key = "14ee8ada5b9c4d6b905132011230712";

class WeatherRemoteDataSourceImpl extends WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<SevenWeatherModel> getWeather(String cityName) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/forecast.json?key=$key&q=$cityName&days=7"),headers: {
      "Content-Type": "application/json"
    });
    if (response.statusCode == 200) {
      print('success');
      final decodedJson = json.decode(response.body);
      final weatherModel = SevenWeatherModel.fromJson(decodedJson);
      return weatherModel;
    } else {
      print('faild');
      throw ServerException();
    }
  }
}
