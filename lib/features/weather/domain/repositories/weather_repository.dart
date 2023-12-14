import 'package:dartz/dartz.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import '../../../../core/errors/failures.dart';

abstract class WeatherRepository {

Future<Either<Failure,SevenWeatherModel>> getWeather( String cityName);

}
