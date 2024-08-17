import 'dart:async';
import 'package:get/get.dart';
import 'package:newweatherapp/Helper/http_request_helper.dart';
import 'package:newweatherapp/Controller/geo_locator_controller.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel extends GetxController {
  RxString weatherMain = ''.obs;
  RxString weatherDiscription = ''.obs;
  RxString iconnn = ''.obs;
  RxDouble tempreture = 0.0.obs;
  RxDouble humadity = 0.0.obs;
  RxDouble feels_like = 0.0.obs;
  RxDouble temp_Min = 0.0.obs;
  RxDouble temp_Max = 0.0.obs;
  RxDouble wind = 0.0.obs;
  RxInt pressure = 0.obs;
  RxInt visibility = 0.obs;

  final GetLocatorController _locationCont = Get.put(GetLocatorController());

  @override
  void onInit() async {
    super.onInit();
    _locationCont.getLocation();
    GetLocationWeather(
        _locationCont.latitude.value, _locationCont.longitude.value);
  }

  @override
  void onClose() {
    _locationCont.streamSubscription!.cancel();
  }

  Future<dynamic> GetLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        '$weatherApiUrl?lat=$latitude&lon=$longitude&appid=0d530353bd34a9b829051697c6dc7d7b&units=metric');

    var weatherData = await networkHelper.getData();

    weatherMain.value = weatherData['weather'][0]['main'];
    weatherDiscription.value = weatherData['weather'][0]['description'];
    iconnn.value = weatherData['weather'][0]['icon'];

    tempreture.value = weatherData['main']['temp'];
     feels_like.value = weatherData['main']['feels_like'];
    temp_Min.value = weatherData['main']['temp_min'];
    temp_Max.value = weatherData['main']['temp_max'];

     //print(weatherData);
  }
}
