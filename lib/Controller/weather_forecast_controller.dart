import 'dart:async';
import 'package:get/get.dart';
import 'package:newweatherapp/Controller/geo_locator_controller.dart';
import '../Helper/http_request_helper.dart';

const weatherForecastAPI = 'https://api.openweathermap.org/data/2.5/forecast';

class WeatherForecast extends GetxController {
  StreamSubscription<WeatherForecast>? streamSubscription;

  RxList fiveDaysForecast = [].obs;

  RxInt minute = 00.obs;
  RxInt hour = 00.obs;
  RxString icon = ''.obs;
  RxString description = ''.obs;
  RxDouble temp = 0.0.obs;

  final GetLocatorController _locationCont = Get.put(GetLocatorController());
  @override
  void onInit() async {
    super.onInit();
    _locationCont.getLocation();
    GetLocationWeather(
        _locationCont.latitude.value, _locationCont.longitude.value);
  }

  @override
  void onClose() async {
    _locationCont.streamSubscription!.cancel();
  }

  Future<dynamic> GetLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        '$weatherForecastAPI?lat=$latitude&lon=$longitude&appid=30297a45e286d1d371d9bc262119fdf0&units=metric');
    var forcast_Json = await networkHelper.getData();

    for (int i = 0; i <= 39; i++) {
      hour.value =
          DateTime.fromMillisecondsSinceEpoch(forcast_Json['list'][i]['dt'] * 1000)
              .hour;
      minute.value =
          DateTime.fromMillisecondsSinceEpoch(forcast_Json['list'][i]['dt'] * 1000)
              .minute;
      icon.value = forcast_Json['list'][i]['weather'][0]['icon'];
      temp.value = forcast_Json['list'][i]['main']['temp'] + 0.0;
      description.value = forcast_Json['list'][i]['weather'][0]['description'];
      fiveDaysForecast.value.add([
        hour.value,
        minute.value,
        icon.value,
        description.value,
        temp.value
      ]);
    }
    //entire JSON data
    print(fiveDaysForecast);
  }
}
