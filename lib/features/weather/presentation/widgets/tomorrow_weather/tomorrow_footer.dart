import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';

class TomorrowFooter extends StatelessWidget {
  final SevenWeatherModel model;
  const TomorrowFooter({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Icon(CupertinoIcons.wind_snow),
              ),
              Text(
                '${model.forecast!.forecastday![1].day!.maxwindKph!.toInt().toString()}%',
                style: TextStyle(fontSize: 13),
              ),
              Text('Wind', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Icon(CupertinoIcons.drop),
              ),
              Text(
                '${model.forecast!.forecastday![1].day!.avghumidity!.toInt().toString()}%',
                style: TextStyle(fontSize: 13),
              ),
              Text('Humidity', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Icon(CupertinoIcons.cloud_bolt_rain),
              ),
              Text(
                '${model.forecast!.forecastday![1].day!.dailyChanceOfRain!.toInt().toString()}%',
                style: TextStyle(fontSize: 13),
              ),
              Text('Raining', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
