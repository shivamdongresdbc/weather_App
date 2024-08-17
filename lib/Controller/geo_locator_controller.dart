import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GetLocatorController extends GetxController {
  StreamSubscription<Position>? streamSubscription;
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  var address = ''.obs;



  RxString name = ''.obs;
  RxString street = ''.obs;
  RxString postalCode = ''.obs;
  RxString administrativeArea = ''.obs;
  RxString subAdministrativeArea = ''.obs;
  RxString subLocality = ''.obs;
  RxString country = ''.obs;
  // RxInt hashcode = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      getAddressFromLatlang(position);
    });
  }

  Future<void> getAddressFromLatlang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    address.value = '${place.locality}';
    name.value ='${place.name}';
    administrativeArea.value ='${place.administrativeArea}';
    // hashCode.value ='${place.hashCode}';
    //  postalCode.value = '${place.postalCode}';
    // street.value = '${place.street}';
    subAdministrativeArea.value = '${place.subAdministrativeArea}';
    subLocality.value = '${place.subLocality}';
    country.value ='${place.country}';


  }
}

