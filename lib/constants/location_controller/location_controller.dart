import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var currentLocation = "".obs;

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentLocation.value = "Location services are disabled.";
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentLocation.value = "Location permissions are denied";
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      currentLocation.value = "Location permissions are permanently denied.";
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;

      currentLocation.value =
      "${place.subLocality}, ${place.locality}, ${place.country}";
    } else {
      currentLocation.value =
      "Lat: ${position.latitude}, Lng: ${position.longitude}";
    }
  }
}
