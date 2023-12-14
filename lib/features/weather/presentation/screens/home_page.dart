import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/utils/aler_dialoge.dart';
import 'package:weatherapp/core/utils/loading_widget.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weatherapp/features/weather/presentation/widgets/current_weather/impresive.dart';
import 'package:weatherapp/features/weather/presentation/widgets/current_weather/side_text_widget.dart';
import '../widgets/current_weather/Astrospheric_widget.dart';
import '../widgets/current_weather/divider_widget.dart';
import '../widgets/current_weather/footer_widget.dart';
import '../widgets/current_weather/header_widget.dart';
import '../widgets/current_weather/four_hours_widget.dart';
import '../widgets/current_weather/today_weather_widget.dart';
import '../widgets/current_weather/country_widget.dart';
import '../widgets/current_weather/weather_degree.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return LoadingWidget();
          } else if (state is WeatherErrorState) {
            return showErrorDialog(msg: state.message, context: context);
          }
          else if (state is WeatherLoadedState) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  expandedHeight: MediaQuery.of(context).size.height * 0.78,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.77,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: Color(0xFF009DF8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF1271f4).withOpacity(0.5),
                                  blurRadius: 3.0,
                                  spreadRadius: 4,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                              )),
                          child: Column(
                            children: [
                              HeaderWidget(weather: state.sevenWeatherModel),
                              CountryWidget(
                                weather: state.sevenWeatherModel,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      WeatherDegree(
                                          weather: state.sevenWeatherModel),
                                      Spacer(),
                                      MyDivider(),
                                      FooterWidget(
                                          weather: state.sevenWeatherModel),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TodayWeather(model: state.sevenWeatherModel),
                              FourHoursWidget(
                                  weatherModel: state.sevenWeatherModel),
                              SideTextWidget(
                                text: 'Astronomy Weather Forecasts',
                              ),
                              AstrosphericWidget(
                                  model: state.sevenWeatherModel),
                              SideTextWidget(text: 'Forecasting week')
                            ],
                          ),
                        ),
                        ConChart(weatherModel: state.sevenWeatherModel)
                      ],
                    ),
                  ]),
                ),
              ],
            );
          }
          return LoadingWidget();
        },
      ),
    );
  }
}
