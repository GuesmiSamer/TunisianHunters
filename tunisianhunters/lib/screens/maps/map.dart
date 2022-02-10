import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tunisianhunters/services/Gmaps.dart';
import 'package:geolocation/geolocation.dart';
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  getPermission() async{
    final GeolocationResult result = await Geolocation.requestLocationPermission(permission:const LocationPermission(
        android: LocationPermissionAndroid.fine,
        ios: LocationPermissionIOS.always));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GMap();
  }
}