import '../../features/weather/data/models/SevenWeatherModel.dart';

String conditionImg(SevenWeatherModel weather, int i) {
  final cond = weather.forecast!.forecastday![i].day!.condition!.text;
  if (cond == 'Sunny') {
    return 'assets/images/sunny.png';
  } else if (cond == 'Dry') {
    return 'assets/images/dry.png';
  } else if (cond == 'Cloudy' || cond == 'Partly cloudy') {
    return 'assets/images/cloudy.png';
  } else if (cond == 'Overcast') {
    return 'assets/images/overcast.png';
  } else if (cond == 'Rainy' ||
      cond == 'Patchy rain possible' ||
      cond == 'Moderate rain') {
    return 'assets/images/rainy.png';
  } else if (cond == 'Heavy rain') {
    return 'assets/images/heavyrain.png';
  } else if (cond == 'Windy') {
    return 'assets/images/wind.png';
  } else if (cond == 'Mist') {
    return 'assets/images/mist.png';
  } else if (cond == 'Snow' ||
      cond == 'Moderate snow' ||
      cond == 'Heavy snow' ||
      cond == 'Patchy Moderate snow') {
    return 'assets/images/snow.png';
  } else if (cond == 'Light snow') {
    return 'assets/images/lightsnow.png';
  } else if (cond == 'Light freezing rain'|| cond=='Light freezing') {
    return 'assets/images/lightfreezing.png';
  } else if (cond == 'Thunder') {
    return 'assets/images/thunder.png';
  }
  return 'assets/images/thunderstorm.png';
}
/*


  } else if ( cond == 'Stormy' || ') {
    return 'assets/images/rainy.png';
  } else {
    return 'assets/images/thunder.png';
  }
 */
