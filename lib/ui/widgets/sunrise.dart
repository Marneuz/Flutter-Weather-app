import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';

class Sunrise extends StatelessWidget {
  const Sunrise({super.key, required this.sunrise});

  final DateTime sunrise;

  @override
  Widget build(BuildContext context) {
    final isSpanish = context.locale.languageCode == "es";

    return Row(
      children: [
        Image.asset(
          "assets/images/sunrise.png",
          width: 50,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Sunrise.tr(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              DateFormat(isSpanish ? "HH:mm" : "jm").format(sunrise),
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
