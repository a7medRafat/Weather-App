import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/core/network/network.dart';
import 'package:weatherapp/features/weather/data/datasources/local/weather_local_data_source.dart';
import 'package:weatherapp/features/weather/data/datasources/remote/weather_remote_data_source.dart';
import 'package:weatherapp/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:weatherapp/features/weather/domain/repositories/weather_repository.dart';
import 'package:weatherapp/features/weather/domain/usecases/get_weather_usecase.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => WeatherCubit(weatherUseCase: sl()));


  sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepository: sl()));

  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<WeatherRemoteDataSource>(
      () => WeatherRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<WeatherLocalDataSource>(
      () => WeatherLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  await sl.isReady<SharedPreferences>();

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
