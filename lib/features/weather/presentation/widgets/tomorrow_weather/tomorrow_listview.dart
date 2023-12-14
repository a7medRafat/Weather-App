import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/SevenWeatherModel.dart';

class TomorrowListItems extends StatelessWidget {
  final SevenWeatherModel model;
  final int i;
  final now = DateTime.now();

   TomorrowListItems({super.key, required this.model, required this.i,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/4,
            child: Text(
              DateFormat('EE').format(DateTime((now.day + i))),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white38),
              textAlign: TextAlign.start,
            ),
          ),
          Row(
          mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Image.asset(
                conditionImg(model,i),
                height: 50,
                alignment: AlignmentDirectional.topStart,
              ),
              SizedBox(width:5),
              Text(
                model.forecast!.forecastday![i].day!.condition!.text!.length>15 ?model.forecast!.forecastday![i].day!.condition!.text!.substring(0,15) :model.forecast!.forecastday![i].day!.condition!.text!,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white38,
                ),
                textAlign: TextAlign.start,
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              Text(
                  '+${model.forecast!.forecastday![i].day!.maxtempC!.toInt()}\u00B0'),
              Text(
                ' ${model.forecast!.forecastday![i].day!.mintempC!.toInt()}\u00B0',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white38),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
