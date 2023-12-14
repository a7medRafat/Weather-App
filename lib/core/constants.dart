import 'package:weatherapp/core/shared_preferances/cache_helper.dart';

const double borderWidth = 0.5;
const double iconSize = 15;
String myLocation = CacheHelper.getData(key: 'isLocated')??'';