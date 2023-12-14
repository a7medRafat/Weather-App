import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/core/utils/go.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import 'package:weatherapp/features/weather/presentation/screens/tomorrow_page.dart';

class TodayWeather extends StatelessWidget {
  final SevenWeatherModel model;

  const TodayWeather({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5
      ),
      child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Text('Today', style: Theme.of(context).textTheme.bodyMedium),
            InkWell(
              splashColor: Colors.transparent,
              onTap: (){
                navigateTo(context, Tomorrow(weatherModel: model));
              },
              child: Row(
                children: [
                  Text(
                    '7 days',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: Colors.white70,
                  )
                ],
              ),
            ),
          ])),
    );
  }
}
