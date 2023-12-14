import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/utils/loading_widget.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weatherapp/features/weather/presentation/widgets/current_weather/divider_widget.dart';
import '../../data/models/SevenWeatherModel.dart';
import '../widgets/tomorrow_weather/tomorrow_body.dart';
import '../widgets/tomorrow_weather/tomorrow_footer.dart';
import '../widgets/tomorrow_weather/tomorrow_header.dart';
import '../widgets/tomorrow_weather/tomorrow_listview.dart';

class Tomorrow extends StatelessWidget {
  final SevenWeatherModel weatherModel;

  Tomorrow({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return LoadingWidget();
        } else if (state is WeatherErrorState) {
        } else if (state is WeatherLoadedState) {
          return Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF009DF8),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1271f4).withOpacity(0.5),
                        blurRadius: 3.0,
                        spreadRadius: 4,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TomorrowHeader(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TomorrowBody(
                                sevenWeatherModel: state.sevenWeatherModel),
                            MyDivider(),
                            TomorrowFooter(model: state.sevenWeatherModel)
                          ],
                        ),
                      )
                    ],
                  )
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: ListView.separated(
                        itemBuilder: (context, index) => TomorrowListItems(
                            model: state.sevenWeatherModel, i: index),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 3),
                        itemCount: 7),
                  ),
                ),
              )
            ],
          );
        }
        return LoadingWidget();
      },
    ));
  }
}
