import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/core/utils/go.dart';
import 'package:weatherapp/features/weather/presentation/cubit/weather_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../../../core/utils/button.dart';
import 'drawer_Screen.dart';

class LocationPage extends StatefulWidget {
  String? currentAddress;
  Position? currentPosition;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  _LocationPageState();

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            padding: EdgeInsets.all(8),
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => widget.currentPosition = position);
      _getAddressFromLatLng(widget.currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            widget.currentPosition!.latitude, widget.currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        myLocation = '${place.subAdministrativeArea}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset('assets/images/loc.png'),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        'ADDRESS\n ${myLocation?? ""}',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.redAccent,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'take care of your day by \n checking the weather forecast',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.black87),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: AppButton(
                              widget:
                              myLocation.isEmpty? TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _getCurrentPosition();
                                      print('my location =>$myLocation');
                                    });
                                  },
                                  child: Text('allow access')) :
                              TextButton(
                                  onPressed: () {
                                    WeatherCubit.get(context).getWeather();
                                    navigateAndFinish(context, Zoom());
                                    CacheHelper.saveData(
                                        key: 'isLocated',
                                        value: myLocation
                                            .toString());
                                  },
                                  child: Text('get weather'))
                          )

                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
