part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoadingState extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoadedState extends WeatherState {
  final SevenWeatherModel sevenWeatherModel;

  const WeatherLoadedState({required this.sevenWeatherModel});

  @override
  List<Object?> get props => [sevenWeatherModel];
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
