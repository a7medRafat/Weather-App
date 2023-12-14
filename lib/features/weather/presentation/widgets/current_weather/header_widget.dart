import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weatherapp/features/weather/data/models/SevenWeatherModel.dart';
import 'package:weatherapp/core/constants.dart';

import '../../../../../core/utils/leading_btn.dart';

class HeaderWidget extends StatelessWidget {
  final SevenWeatherModel weather;

  HeaderWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeadingIcon(widget: Icon(CupertinoIcons.square_grid_2x2,size: 15,),
              fun: (){
                ZoomDrawer.of(context)!.toggle();
              }),
          Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                color: Colors.white,
                size: 20,
              ),
              Text(
                weather.location!.name!,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.more_vert, size: iconSize))
        ],
      ),
    );
  }
}
