import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc_observer.dart';
import 'package:weatherapp/core/utils/app_theme.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import 'core/constants.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'features/weather/presentation/screens/location_page.dart';
import 'features/weather/presentation/screens/drawer_Screen.dart';
import 'injuctoin_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await di.init();
  await CacheHelper.init();
  print("=>>>>>>>>>>$myLocation");


  dynamic isLocated = CacheHelper.getData(key: 'isLocated');
  final Widget widget;

  if (isLocated != null) {
    widget = Zoom();
  } else {
    widget = LocationPage();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatefulWidget {
  final Widget startWidget;

  MyApp({super.key, required this.startWidget});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: BlocProvider(
          create: (_) => di.sl<WeatherCubit>()..getWeather(),
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: appTheme(),
              home: widget.startWidget
          ),
        ));
  }
}
