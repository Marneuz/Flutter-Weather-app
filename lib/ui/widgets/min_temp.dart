import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';

class MinTemperature extends StatelessWidget {
  const MinTemperature({super.key, required this.temperature});

  final int temperature;

  @override
  Widget build(BuildContext context) {
    final isEnglish = context.locale.languageCode == "en";
    final convertedTemperature =
        isEnglish ? ((temperature * 9 / 5) + 32).round() : temperature;

    return Row(
      children: [
        Image.asset(
          "assets/images/mintemp.png",
          width: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Temp_Min.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "$convertedTemperature ${isEnglish ? "°F" : "°C"}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
