import 'package:flutter/material.dart';

class AdditionalInformation extends StatelessWidget {
  final IconData icon;
  final String  label;
  final String  value;

  const AdditionalInformation({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          children: [
            Icon(
              icon,
              size: 54,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              label,
              style:const TextStyle(
                fontSize: 18,
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style:const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
