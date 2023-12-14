import 'package:flutter/material.dart';
import 'package:weatherapp/core/utils/app_colors.dart';

ThemeData appTheme(){
  return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFF030317),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15
          )
      ),
      textTheme: TextTheme(
        headlineLarge: (TextStyle(
            fontSize: 120,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
            color: AppColors.primaryColor,
          height: 0.8
        )),
        bodyLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
          color: AppColors.primaryColor
        ),
        bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times',
            color: Colors.white

        ),
        bodySmall: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: 'Times'

        ),
      ),
    iconTheme: IconThemeData(
      color: Colors.white,
    )

  );
}