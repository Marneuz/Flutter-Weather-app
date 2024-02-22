import 'package:flutter/material.dart';

Widget getWeatherIcon(int code) {
  // Usa un valor por defecto para entrar en el bloque switch
  final int category = code ~/ 100;

  switch (category) {
    case 2: // Thunderstorm
      return Image.asset('assets/images/thunderstorm.png');
    case 3: // Drizzle
      return Image.asset('assets/images/rain.png');
    case 5: // Rain
      return Image.asset('assets/images/heavy_rain.png');
    case 6: // Snow
      return Image.asset('assets/images/snow.png');
    case 7: // Atmosphere (fog, mist, etc.)
      return Image.asset('assets/images/fog.png');
    case 8:
      if (code == 800) {
        // Clear
        return Image.asset('assets/images/clear.png');
      } else {
        // Clouds
        return Image.asset('assets/images/overcast.png');
      }
    default: // Por defecto o en caso de no reconocer el código
      return Image.asset('assets/images/overcast.png');
  }
}
