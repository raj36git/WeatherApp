import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [
            Text(
              '09:00',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Icon(
              Icons.cloud,
              size: 54,
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              '300.17',
              style: TextStyle(
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

