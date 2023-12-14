import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/condition_img.dart';
import '../../../data/models/SevenWeatherModel.dart';

class ImageWidget extends StatelessWidget {
  final SevenWeatherModel weatherModel;
  const ImageWidget({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
     padding: EdgeInsets.zero,
     alignment: Alignment.topCenter,
      width: double.infinity,
      child: Image.asset(

      conditionImg(weatherModel,0),height: MediaQuery.of(context).size.height/2.5,
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,

      ),
    );
  }

}
