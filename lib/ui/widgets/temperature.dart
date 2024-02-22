import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  const Temperature({super.key, required this.temperature});

  final int temperature;

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.locale.languageCode == "en";
    final displayTemperature = isEnglish
        ? "${(temperature * 9 / 5 + 32).round()}°F"
        : "$temperature°C";

    return Center(
      child: Text(
        displayTemperature,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
