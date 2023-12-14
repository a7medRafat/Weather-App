// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weatherapp/core/utils/button.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';

class ChooseCityWidget extends StatelessWidget {
  final controller;
  final String hint;
  final fun;

  ChooseCityWidget({
    super.key,
    required this.controller,
    required this.hint, required this.fun,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textField(context),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: AppButton(
              widget: IconButton(
                  onPressed: fun,
                  icon: Icon(CupertinoIcons.location,size: 18,)),
            ))
      ],
    );
  }

  Widget textField(context) => TextFormField(

    scrollPadding: EdgeInsets.only(bottom:  40.0),
    style: Theme.of(context).textTheme.bodySmall,
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return 'required city name';
      }
    },
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.bodySmall,
      filled: false,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white54, width: 0.7),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.blueAccent,
          width: 2,
        ),
      ),
    ),
  );
}
