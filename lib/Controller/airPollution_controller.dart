import 'dart:async';
import 'package:get/get.dart';
import 'package:newweatherapp/Controller/geo_locator_controller.dart';
import 'package:newweatherapp/Helper/http_request_helper.dart';

const airPollutionApiUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';

class AirPollution extends GetxController{

  StreamSubscription<AirPollution>?streamSubscription;

  RxDouble airQualityIndex = 0.0.obs;
  RxDouble hour_Time =0.0.obs;
  RxDouble minuts_Time = 0.0.obs;

  RxDouble Co =0.0.obs;
  RxDouble No =0.0.obs;
  RxDouble O3 =0.0.obs;
  RxDouble So2 =0.0.obs;
  RxDouble pm2_5 = 0.0.obs;
  RxDouble pm10 = 0.0.obs;
  RxDouble No2 = 0.0.obs;
  String description ='';
  String messege ='';

  final GetLocatorController _latitudeLogitude = Get.put(GetLocatorController());

  @override
  void onInit() async {
    super .onInit();
    _latitudeLogitude.getLocation();
    GetLocationWeather(
      _latitudeLogitude.latitude.value, _latitudeLogitude.longitude.value
    );
  }

  @override
  void onClose(){
    _latitudeLogitude.streamSubscription!.cancel();
  }

Future<dynamic> GetLocationWeather(double latitude, double longitude) async{
    NetworkData networkHelper = NetworkData(
       '$airPollutionApiUrl?lat=$latitude&lon=$longitude&appid=bcf22dfb684fec95302cac6c27ca7878&units=metric'
    );

    var airpollutiondata = await networkHelper.getData();

    print (airpollutiondata);

    airQualityIndex.value = airpollutiondata['list'][0]['main']['aqi']+0.0;
    Co.value = airpollutiondata['list'][0]['components']['co']+0.0;
    No.value = airpollutiondata['list'][0]['components']['no']+0.0;
    No2.value = airpollutiondata['list'][0]['components']['no2']+0.0;
    So2.value = airpollutiondata['list'][0]['components']['so2']+0.0;
    pm2_5.value = airpollutiondata['list'][0]['components']['pm2_5']+0.0;
    pm10.value = airpollutiondata['list'][0]['components']['pm10']+0.0;
    O3.value = airpollutiondata['list'][0]['components']['o3']+0.0;

    if(pm10 > 0 && pm10 <= 25 ){
      description = 'Good & Healthy';
      messege = 'Air is Good and Healthy, '
          'A perfect day for walk';
    }
    else if(pm10 >= 26 && pm10 <= 50){
      description = 'Fair';
      messege = 'Air is Fair but not Good, '
          'It can be harmful for Sensitive groups';
    }
    else if(pm10 >=51 && pm10 <= 90){
      description = 'Modrate';
      messege = 'Air is Modrate, '
          'It can be harmful for Sensitive groups';
    }
    else if(pm10 >= 91 && pm10 >= 180){
      description = 'Poor';
      messege = 'Members of Sensitive group should be affected,'
          ' General public likely not been affected.';
    }
    else if(pm10 >= 181 && pm10 >= 200){
      description = 'Unhealthy';
      messege = 'Everyone mey begin to experience the health issues';
    }
    print(description);
    print(messege);



}

}
