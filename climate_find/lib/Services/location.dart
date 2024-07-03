import 'package:geolocator/geolocator.dart';
import 'package:climate_find/utilities/constants.dart';
import 'package:http/http.dart' as http;

getlocation() async {
  try {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double latititude = position.latitude;
    double longitude = position.longitude;
    String url =
        'https://api.weatherapi.com/v1/current.json?key=$apikey&q=$latititude,$longitude#';
    var link = Uri.parse(url);
    var response = await http.get(link);
    return response;
  } catch (e) {
    String url =
        'https://api.weatherapi.com/v1/current.json?key=$apikey&q=kuchbhi#';
    var link = Uri.parse(url);
    var response = await http.get(link);
    return response;
  }
}
