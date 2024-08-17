// import 'Helper/http_request_helper.dart';
// import 'package:get/get.dart';
//
// const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';
//
// class WeatherModel extends GetxController {
//   RxString weatherMain = 'Weather'.obs;
//   RxString weatherDescription = 'Weather Description'.obs;
//   RxString icon = 'icon'.obs;
//
//   RxDouble temperature = 0.0.obs;
//   RxDouble feels_like = 0.0.obs;
//   RxInt humidity = 0.obs;
//   RxDouble wind = 0.0.obs;
//   RxInt pressure = 0.obs;
//   RxInt visibility = 0.obs;
//
//   // final LocationConroller _locationcont = Get.put(LocationController());
//
//   @override
//   void onInit() async {
//     super.onInit();
//     // _locationcont.getLocation();
//     getLocationWeather(22.7196, 75.8577);
//   }
//
//   @override
//   void onClose() {
//     getLocationWeather(22.7196, 75.8577);
//   }
//
//   Future<dynamic> getLocationWeather(double latitude, double longitude) async {
//     NetworkData networkHelper = NetworkData(
//         '$weatherApiUrl?lat=$latitude&lon=$longitude&appid=0d530353bd34a9b829051697c6dc7d7b&units=metric');
//
//     var weatherData = await networkHelper.getData();
//
//     // print('Weather Data: $weatherData');
//     weatherMain.value = weatherData['weather'][0]['main'];
//     weatherDescription.value = weatherData['weather'][0]['description'];
//     temperature.value = weatherData['main']['temp'];
//
//     humidity.value = weatherData['main']['humidity'];
//     pressure.value = weatherData['main']['pressure'];
//     feels_like.value = weatherData['main']['feels_like'];
//     // wind.value = weatherData['main']['wind']['speed'];
//
//     visibility.value = weatherData['visibility'];
//
//     // icon.value = weatherData['weather'][0]['icon'];
//     wind.value = weatherData['wind']['speed'];
//     print(weatherData);
//   }
// }


//Geolocation controllser ankush
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
//
// class LocationController extends GetxController {
//   RxDouble latitude = 0.0.obs;
//   RxDouble longitude = 0.0.obs;
//   var address = ''.obs;
//   StreamSubscription<Position>? streamSubscription;
//
//   @override
//   void onInit() async {
//     super.onInit();
//     getLocation();
//   }
//
//   @override
//   void onReady() async {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     streamSubscription?.cancel();
//   }
//   getLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//
//       await Geolocator.openLocationSettings();
//       return Future.error('Location Services are disabled.');
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied,we cannot request permissions.'
//       );
//     }
//
//     streamSubscription =
//         Geolocator.getPositionStream().listen((Position position) {
//
//           latitude.value = position.latitude;
//           longitude.value = position.longitude;
//           getAddressFromLatLang(position);
//         });
//   }
//
//   Future<void> getAddressFromLatLang(Position position) async {
//     List<Placemark> placemark =
//     await placemarkFromCoordinates(position.latitude, position.longitude);
//     Placemark place = placemark[0];
//     address.value = '${place.locality}';
//   }
// }

// import 'dart:async';
//
//
// import 'Helper/http_request_helper.dart';
// import 'package:get/get.dart';
//
// const forcastApiUrl = 'https://api.openweathermap.org/data/2.5/forecast';
// class FiveDaysModel extends GetxController{
//
//   StreamSubscription<FiveDaysModel>?streamSubscription;
//
//
//
//
//   //five day forecast
//
//   RxList fivedayforecast = [].obs;
//
//   RxList eightForecast = [].obs;
//
//   RxString icon1 = 'icon'.obs;
//   // RxString icon2 = 'icon'.obs;
//   RxInt hour1   = 0.obs;
//   RxInt minute1   = 0.obs;
//   // RxDouble icon1   = 0.0.obs;
//   RxDouble temp1   = 0.0.obs;
//
//
//
//   // final GetLocatorController _locationcont = Get.put(GetLocatorController());
//   //
//   @override
//   void onInit() async {
//     super.onInit();
//     // _locationcont.getLocation();
//     // getLocationWeather(_locationcont.latitude.value, _locationcont.longitude.value);
//     getLocationWeather(
//         22.7196, 75.8577);
//   }
//
//   @override
//   void onClose() async {
//     // _locationcont.streamSubscription!.cancel();
//     getLocationWeather(22.7196,75.8577);
//     streamSubscription?.cancel();
//
//   }
//
//
//
//   Future<dynamic> getLocationWeather(
//       double latitude,double longitude) async {
//     var networkHelper = NetworkData
//       ('$forcastApiUrl?lat=$latitude&lon='
//         '$longitude&appid=0d530353bd34a9b829051697c6dc7d7b&units=metric');
//
//     var fivedays = await networkHelper.getData();
//
//     // entire json data
//
//     // fivedayforecast.value = fivedays['list'];
//     // icon2.value = fivedays['list'][0]['weather'][0]['icon'];
//
//     // print(time);
//     // print(time_24h.split('10'));
//     // print(time_3h);
//     // print(fivedayforecast[1]);
//     // print(wind_12h);
//
//
//     for (int i = 0; i <= 39; i++) {
//       hour1.value = DateTime
//           .fromMillisecondsSinceEpoch(
//           fivedays['list'][i]['dt'] * 1000)
//           .hour;
//       minute1.value = DateTime
//           .fromMillisecondsSinceEpoch(
//           fivedays['list'][i]['dt'] * 1000)
//           .minute;
//       icon1.value = fivedays['list'][i]['weather'][0]['icon'];
//       temp1.value = fivedays['list'][i]['main']['temp'] + 0.0;
//
//       eightForecast.value.add(
//           [hour1.value, minute1.value, icon1.value, temp1.value
//           ]
//       );
//     }
//   }}
