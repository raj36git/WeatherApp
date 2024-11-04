import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/secrets_screen.dart';
import 'additional_info.dart';
import 'hourly_weather_forecast.dart';
import 'package:http/http.dart' as http;

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }
  Future getCurrentWeather() async {
    String cityName = "London";
   final res = await http.get(Uri.parse('api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPID=$openWeatherAPIKey',)
   );
   print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueAccent.shade200,
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('refresh');
              },
              icon: const Icon(Icons.refresh))
        ],
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade200,
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            //main cart
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 9,
                      sigmaY: 9,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            '300 K',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 90,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
                                fontSize: 26, color: Colors.deepPurpleAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            //weather forecast
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(
                    time: '00:00',
                    icon: Icons.cloud,
                    temperature: "300.17",
                  ),
                  HourlyForecast(
                    time: '03:00',
                    icon: Icons.sunny,
                    temperature: "302.11",
                  ),
                  HourlyForecast(
                    time: '06:00',
                    icon: Icons.sunny,
                    temperature: "312.17",
                  ),
                  HourlyForecast(
                    time: '09:00',
                    icon: Icons.sunny,
                    temperature: "302.22",
                  ),
                  HourlyForecast(
                    time: '12:00',
                    icon: Icons.cloud,
                    temperature: "289.17",
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            //additional info
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformation(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91',
                ),
                AdditionalInformation(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.5',
                ),
                AdditionalInformation(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1000',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
