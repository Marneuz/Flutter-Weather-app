// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Select_Language": "Select Language",
    "Spanish": "Spanish",
    "English": "English",
    "Temp_Max": "Temp Max",
    "Temp_Min": "Temp Min",
    "Sunrise": "Sunrise",
    "Sunset": "Sunset",
    "City": "City",
    "Clear": "Clear",
    "Clouds": "Clouds",
    "Rain": "Rain",
    "Snow": "Snow",
    "Thunderstorm": "Thunderstorm",
    "Drizzle": "Drizzle",
    "Mist": "Mist",
    "Smoke": "Smoke",
    "Haze": "Haze",
    "Dust": "Dust",
    "Fog": "Fog",
    "Sand": "Sand",
    "Ash": "Ash",
    "Squall": "Squall",
    "Tornado": "Tornado",
    "Language_switched": "Language switched to English",
    "Language_already_selected": "Language already selected: English",
    "Fetch_Weather_by_a_City": "Fetch Weather by a City",
    "City_Name": "City Name",
    "Get_Weather": "Get Weather"
  };
  static const Map<String, dynamic> es = {
    "Select_Language": "Seleccione idioma",
    "Spanish": "Español",
    "English": "Inglés",
    "Temp_Max": "Temp Máx",
    "Temp_Min": "Temp Mín",
    "Sunrise": "Amanecer",
    "Sunset": "Atardecer",
    "City": "Ciudad",
    "Clear": "Despejado",
    "Clouds": "Nublado",
    "Rain": "Lluvia",
    "Snow": "Nieve",
    "Thunderstorm": "Tormenta",
    "Drizzle": "Llovizna",
    "Mist": "Niebla",
    "Smoke": "Humo",
    "Haze": "Bruma",
    "Dust": "Polvoriento",
    "Fog": "Niebla",
    "Sand": "Arenoso",
    "Ash": "Ceniza",
    "Squall": "Chubasco",
    "Tornado": "Tornado",
    "Language_switched": "Idioma cambiado a Español",
    "Language_already_selected": "Idioma ya seleccionado: Español",
    "Fetch_Weather_by_a_City": "Búsqueda del tiempo por ciudad",
    "City_Name": "Nombre de la Ciudad",
    "Get_Weather": "Obtener el tiempo"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "es": es
  };
}
