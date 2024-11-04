import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  final String time;
  final IconData icon;
  final String temperature;

  const HourlyForecast({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 10,
      child: Padding(
        padding:const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text(
              time, //it should be dynamic
              style:const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Icon(
              icon,
              size: 54,
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              temperature, //it should be dynamic
              style:const TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
