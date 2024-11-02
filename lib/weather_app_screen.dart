import 'dart:ui';

import 'package:flutter/material.dart';
import 'additional_info.dart';
import 'hourly_weather_forecast.dart';

class WeatherAppScreen extends StatelessWidget {
  const WeatherAppScreen({super.key});

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
                      padding: EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            '300 °F',
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 99,
                          ),
                          SizedBox(
                            height: 13,
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
              height: 18,
            ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),

            //weather forecast
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecast(),
                  HourlyForecast(),
                  HourlyForecast(),
                  HourlyForecast(),
                  HourlyForecast(),
                ],
              ),
            ),

            const SizedBox(
              height: 18,
            ),

            //additional info
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 14,
            ),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformation(),
                AdditionalInformation(),
                AdditionalInformation(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
