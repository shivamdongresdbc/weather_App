import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeatherApp'),
        backgroundColor: Colors.lightBlueAccent,
        shadowColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Center(
            child: Row(children: [
              Icon(
                Icons.water_drop_sharp,
                size: 90,
              ),
              Flexible(
                child: Row(children: [
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: 'latitude 23.72',
                        hintText: 'altitude 23.72',
                        prefixIcon: Icon(Icons.numbers_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        labelText: 'latitude 23.72',
                        hintText: 'altitude 23.72',
                        prefixIcon: Icon(Icons.numbers_sharp),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
