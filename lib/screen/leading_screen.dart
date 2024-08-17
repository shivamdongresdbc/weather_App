import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:newweatherapp/Controller/weather_forecast_controller.dart';
import 'package:newweatherapp/Controller/weathermodel.dart';
import 'package:newweatherapp/screen/airQualityIndexScreen.dart';
import 'package:newweatherapp/widgets/leading_page_humidity_card.dart';
import 'package:newweatherapp/widgets/leadingpage_cards.dart';
import 'package:newweatherapp/Controller/geo_locator_controller.dart';

class LeadingPPage extends StatefulWidget {
  LeadingPPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LeadingPPage> createState() => _LeadingPPageState();
}

class _LeadingPPageState extends State<LeadingPPage> {
  GetLocatorController _geoLocatorCout = Get.put(GetLocatorController());

  WeatherModel weatherCont = Get.put(WeatherModel());

  WeatherForecast weatherForecast = Get.put(WeatherForecast());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        backgroundColor: Colors.lightBlueAccent,
        shadowColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 700,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/appBackimage.jpg'),
              fit: BoxFit.fitHeight,
            )),
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Column(children: [
               Card(
                   color: Colors.transparent,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16),
                       side: BorderSide(color: Colors.transparent, width: 1)),
                   elevation: 10,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                                child: Obx(() => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'Longitude: ${_geoLocatorCout.longitude.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 24),
                                          //   ),
                                          // ),
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'Latitude: ${_geoLocatorCout.latitude.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 24),
                                          //   ),
                                          // ),
                                          Card(
                                            color: Colors.transparent,
                                            margin: EdgeInsets.all(10),
                                            elevation: 10,
                                            // shape: RoundedRectangleBorder(
                                            //     side: BorderSide(
                                            //         color: Colors.transparent,
                                            //         width: 1),
                                            //     borderRadius:
                                            //         BorderRadius.circular(5)),
                                            child: Text(
                                              'Address: ${_geoLocatorCout.address.value}'
                                              '\nDist-${_geoLocatorCout.subAdministrativeArea.value}'
                                              ',${_geoLocatorCout.administrativeArea.value}'
                                              '\n${_geoLocatorCout.country.value}.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            ),
                                          ),
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'Sub-Locatity: ${_geoLocatorCout.subLocality.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 22),
                                          //   ),
                                          // ),
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'Country: ${_geoLocatorCout.country.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 24),
                                          //   ),
                                          // ),
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'District: ${_geoLocatorCout.subAdministrativeArea.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 24),
                                          //   ),
                                          // ),
                                          // Card(
                                          //   color: Colors.black12,
                                          //   margin: EdgeInsets.all(10),
                                          //   elevation: 10,
                                          //   shape: RoundedRectangleBorder(
                                          //       side: BorderSide(
                                          //           color: Colors.transparent,
                                          //           width: 1),
                                          //       borderRadius:
                                          //           BorderRadius.circular(5)),
                                          //   child: Text(
                                          //     'Administrative-Area: ${_geoLocatorCout.administrativeArea.value}',
                                          //     style: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 20),
                                          //   ),
                                          // ),
                                        ])))
                          ],
                        ),
                      ],
                    ),
                  ),

              Card(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.transparent, width: 1)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color(0xFF0E3311).withOpacity(0.01)),
                    ),
                    onPressed: () {
                      Get.to(const AirPollutionIndexScreen());
                    },
                    child: Text(
                      'Air Quality Index',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.black),
                    ),
                  ),
              ),
              Card(
                  color: Colors.transparent,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.transparent, width: 1)),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Obx(
                                () => Image.network(
                                  'http://openweathermap.org/img/w/'
                                  '${weatherCont.iconnn}.png',
                                ),
                              ),
                              Obx(
                                () => Text(
                                  '${weatherCont.weatherMain}..',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Obx(
                                () => Text(
                                  '${weatherCont.tempreture}°C',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 50),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Obx(
                                    () => Text(
                                      'temp_Max =${weatherCont.temp_Max}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      'temp_Min =${weatherCont.temp_Min}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ]),
                  ]),
              ),
              SizedBox(
                  height: 188,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 39,
                      itemBuilder: (BuildContext, int index) {
                        return Obx(
                          () => (CardsCustomLeadimgForPage(
                            timing:
                                "${weatherForecast.fiveDaysForecast[index][0]}",
                            iconss: ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: 0.5,
                                child: Image.network(
                                  'http://openweathermap.org/img/w/'
                                  '${weatherForecast.fiveDaysForecast[index][2]}.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            description:
                                '${weatherForecast.fiveDaysForecast[index][3]}',
                            tempreture:
                                '${weatherForecast.fiveDaysForecast[index][4]}°C',
                            timingMinuts:
                                ":${weatherForecast.fiveDaysForecast[index][1]}",
                          )),
                        );
                      }),
              ),
              Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LeadingPageHumidityCard(
                          name: 'Humidity',
                          airPolution: '',
                          number: '24%',
                          icon: Icons.water_drop_sharp),
                      LeadingPageHumidityCard(
                          name: 'Tempreture',
                          airPolution: '',
                          number: '22°C',
                          icon: Icons.rotate_90_degrees_cw_sharp),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LeadingPageHumidityCard(
                          name: 'Wind',
                          airPolution: '',
                          number: '15.45 m/hr',
                          icon: Icons.wind_power_sharp),
                      LeadingPageHumidityCard(
                          name: 'Humidity',
                          airPolution: '',
                          number: '24%',
                          icon: Icons.water_drop_sharp),
                    ],
                  ),
              ])
            ]),
                )),
          ),
        ]),
      ),
    );
  }
}
