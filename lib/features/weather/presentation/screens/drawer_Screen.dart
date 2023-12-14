import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:weatherapp/features/weather/presentation/screens/home_page.dart';

import 'menue_screen.dart';

class Zoom extends StatefulWidget {
  const Zoom({super.key});

  @override
  State<Zoom> createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> {
  @override
  Widget build(BuildContext context) {
    final cubit = WeatherCubit.get(context);
    return Scaffold(
      body: ZoomDrawer(
        controller: cubit.drawerController,
        style: DrawerStyle.defaultStyle,
        borderRadius: 24.0,
        slideWidth: MediaQuery.of(context).size.width * (0.6),
        openCurve: Curves.fastLinearToSlowEaseIn,
        closeCurve: Curves.bounceIn,
        angle: 0.0,
        showShadow: true,
        menuScreen: MenuDrawer(),
        mainScreen: Home(),
      ),
    );
  }
}
