import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String? cityName;
  final String country;
  final String date;
  final dynamic temp;
  final dynamic maxWindKph;
  final dynamic avgHumidity;
  final dynamic chanceOfRain;
  final String weatherCondition;


  Weather(
      {required this.cityName,
      required this.country,
      required this.date,
      required this.temp,
      required this.maxWindKph,
      required this.avgHumidity,
      required this.chanceOfRain,
      required this.weatherCondition});


  @override
  // TODO: implement props
  List<Object?> get props => [cityName,country,date,temp,maxWindKph,avgHumidity,chanceOfRain,weatherCondition];
}
