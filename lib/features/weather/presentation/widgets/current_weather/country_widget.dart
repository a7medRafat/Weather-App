import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../data/models/SevenWeatherModel.dart';
import '../../../../../core/constants.dart';


class CountryWidget extends StatelessWidget {
  final SevenWeatherModel weather;
  const CountryWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white54, width: borderWidth)),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 2),
              Text(weather.location!.country.toString() , style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ));
  }
}
