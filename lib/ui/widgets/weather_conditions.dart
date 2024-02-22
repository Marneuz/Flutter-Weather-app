import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';

class WeatherConditions extends StatelessWidget {
  const WeatherConditions({super.key, required this.weatherMain});

  final String weatherMain;

  @override
  Widget build(BuildContext context) {
    String conditionText = _localizationWeatherCondition(weatherMain, context);

    return Center(
      child: Text(
        conditionText.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  String _localizationWeatherCondition(String condition, BuildContext context) {
    switch (condition) {
      case "Clear":
        return LocaleKeys.Clear.tr();
      case "Clouds":
        return LocaleKeys.Clouds.tr();
      case "Rain":
        return LocaleKeys.Rain.tr();
      case "Snow":
        return LocaleKeys.Snow.tr();
      case "Thunderstorm":
        return LocaleKeys.Thunderstorm.tr();
      case "Drizzle":
        return LocaleKeys.Drizzle.tr();
      case "Mist":
        return LocaleKeys.Mist.tr();
      default:
        return condition; // Retornar la condición tal cual si no hay traducción
    }
  }
}
