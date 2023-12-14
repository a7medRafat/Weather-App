import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';

import 'image_widget.dart';

class WeatherDegree extends StatelessWidget {
  final SevenWeatherModel weather;

  const WeatherDegree({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(

            alignment: Alignment.topCenter,
              child: ImageWidget(weatherModel: weather)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GlowText(
                      "${weather.forecast!.forecastday![0].day!.maxtempC!.round()}",
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text(
                    weather.forecast!.forecastday![0].day!.condition!.text
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 20),
                  ),
                  Text(
                    weather.forecast!.forecastday![0].date.toString(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
