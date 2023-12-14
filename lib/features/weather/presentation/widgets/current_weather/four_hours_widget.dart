import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/core/utils/app_colors.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import '../../../../../core/utils/condition_img.dart';

class FourHoursWidget extends StatelessWidget {
  final SevenWeatherModel weatherModel;

  FourHoursWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final int current = DateTime.now().hour;
    final day = weatherModel.forecast!.forecastday![0];
    final one = day.hour![current == 0 ? 23 : current - 1].time;
    final two = day.hour![current].time;
    final three = day.hour![ current + 1].time;
    final four = day.hour![ 1].time;
    return Container(
        height: MediaQuery.of(context).size.height * 0.16,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBodyItem(
                context: context,
                bodyNumber: one.toString(),
                model: weatherModel),
            _buildSelectedItem(
                context: context,
                bodyNumber: two.toString(),
                model: weatherModel),
            _buildBodyItem(
                context: context,
                bodyNumber: three.toString(),
                model: weatherModel),
            _buildBodyItem(
                context: context,
                bodyNumber: four.toString(),
                model: weatherModel),
          ],
        ));
  }

  bool isHovering = true;

  Widget _buildBodyItem({
    required BuildContext context,
    required String bodyNumber,
    required SevenWeatherModel model,
  }) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white54, width: 0.4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  '${weatherModel.forecast!.forecastday![0].hour![1].tempC!.toString()}\u00B0'),
              Container(
                child: Image.asset(
                  conditionImg(weatherModel, 0),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                bodyNumber.substring(bodyNumber.length - 5),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );

  Widget _buildSelectedItem({
    required BuildContext context,
    required String bodyNumber,
    required SevenWeatherModel model,
  }) =>
      InkWell(
        onTap: () {},
        onHover: (hovering) {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: BoxDecoration(
            color: isHovering ? AppColors.appColor : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      '${weatherModel.forecast!.forecastday![0].hour![1].tempC!.toString()}\u00B0'),
                  Container(
                    child: Image.asset(
                      conditionImg(weatherModel, 0),
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    bodyNumber.substring(bodyNumber.length - 5),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      );



}
