import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weatherapp/core/errors/failures.dart';
import '../../../../core/constants.dart';
import '../../data/models/SevenWeatherModel.dart';
import '../../../../core/failures_message/failures_messages.dart';
import '../../domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase weatherUseCase;
  final drawerController = ZoomDrawerController();

  final city = TextEditingController();

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherCubit({
    required this.weatherUseCase,
  }) : super(WeatherInitial());

  Future<Unit> getWeather() async {
    emit(WeatherLoadingState());
    Either<Failure, SevenWeatherModel> response =
    await weatherUseCase.call(city.text.isEmpty? myLocation : city.text);
    response.fold(
            (failure) =>
            emit(WeatherErrorState(message: _failureMessage(failure))),
            (weather) => emit(WeatherLoadedState(sevenWeatherModel: weather)));
    print(response.toString());
    return Future.value(unit);
  }


  String _failureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHED_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFLINE_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

}

