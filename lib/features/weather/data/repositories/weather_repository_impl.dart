import 'package:dartz/dartz.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import 'package:weatherapp/core/errors/exceptions.dart';

import 'package:weatherapp/core/errors/failures.dart';
import 'package:weatherapp/core/network/network.dart';

import 'package:weatherapp/features/weather/domain/entities/entities.dart';
import '../../domain/repositories/weather_repository.dart';
import '../datasources/local/weather_local_data_source.dart';
import '../datasources/remote/weather_remote_data_source.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final NetworkInfo networkInfo;
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;

  WeatherRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, SevenWeatherModel>> getWeather(String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getWeather(cityName);
        localDataSource.cachesWeather(remoteWeather);
        return right(remoteWeather);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localWeather = await localDataSource.getCachedWeather();
        return right(localWeather);
      } on EmptyCacheException {
        return left(EmptyCacheFailure());
      }
    }
  }
}
