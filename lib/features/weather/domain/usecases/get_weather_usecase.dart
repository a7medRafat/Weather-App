import 'package:dartz/dartz.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import 'package:weatherapp/core/errors/failures.dart';
import 'package:weatherapp/features/weather/domain/repositories/weather_repository.dart';

import '../entities/entities.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});

  Future<Either<Failure, SevenWeatherModel>> call(String? cityName) async {
    return await weatherRepository.getWeather(cityName!);
  }
}
