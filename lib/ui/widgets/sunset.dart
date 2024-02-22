import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';

class Sunset extends StatelessWidget {
  const Sunset({super.key, required this.sunset});

  final DateTime sunset;

  @override
  Widget build(BuildContext context) {
    final isSpanish = context.locale.languageCode == "es";

    return Row(
      children: [
        Image.asset(
          "assets/images/sunset.png",
          width: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Sunset.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              DateFormat(isSpanish ? "HH:mm" : "jm").format(sunset),
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
