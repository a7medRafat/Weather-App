import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import 'package:weatherapp/features/weather/presentation/widgets/current_weather/virtical_divider.dart';

import 'circle_percentage.dart';

class AstrosphericWidget extends StatelessWidget {
  final SevenWeatherModel model;

  const AstrosphericWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Colors.blue.withOpacity(0.4),
              Colors.blue.withOpacity(0.2),
              Colors.blue.withOpacity(0.1)
            ],
            stops: const [0.0, 0.3, 0.6],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      model.forecast!.forecastday![0].astro!.moonPhase
                          .toString(),
                      style: Theme.of(context).textTheme.bodySmall),
                  CirclePercentage(
                    model: model,
                  )
                ],
              ),
              Spacer(),
              SecondDivider(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sunrise: ${model.forecast!.forecastday![0].astro!.sunrise}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Sunset: ${model.forecast!.forecastday![0].astro!.sunset}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Moonrise: ${model.forecast!.forecastday![0].astro!.moonrise}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Moonset:${model.forecast!.forecastday![0].astro!.moonset}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ]),
              SizedBox(width: 20)
            ],
          ),
        ),
      ),
    );
  }
}
