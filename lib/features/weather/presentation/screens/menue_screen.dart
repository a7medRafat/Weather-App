import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weatherapp/features/weather/presentation/widgets/current_weather/choose_city_widget.dart';

class MenuDrawer extends StatelessWidget {
  MenuDrawer({super.key});

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChooseCityWidget(
                controller: WeatherCubit.get(context).city,
                hint: 'Choose City',
                fun: () {
                  if (formKey.currentState!.validate()) {
                    WeatherCubit.get(context).getWeather();
                    WeatherCubit.get(context).city.clear();
                    ZoomDrawer.of(context)!.toggle();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
