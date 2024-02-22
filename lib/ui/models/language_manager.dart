import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';

class LanguageManager {
  // Cambia el idioma de la aplicación a español.
  static void switchToSpanish(BuildContext context) {
    if (context.locale == const Locale('es')) {
      _showAlreadySelected(context);
    } else {
      _setLocale(context, const Locale('es'), 'Idioma cambiado a Español');
    }
  }

// Cambia el idioma de la aplicación a inglés.
  static void switchToEnglish(BuildContext context) {
    if (context.locale == const Locale('en')) {
      _showAlreadySelected(context);
    } else {
      _setLocale(context, const Locale('en'), 'Language switched to English');
    }
  }

// Muestra un SnackBar si el idioma seleccionado ya está activo.
  static void _showAlreadySelected(BuildContext context) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(LocaleKeys.Language_already_selected.tr()),
          backgroundColor: Colors.deepPurple,
          duration: const Duration(seconds: 3),
        ),
      );
  }

// Muestra un SnackBar cuando el idioma ha sido cambiado.
  static void _showLanguageSwitched(BuildContext context, String translation) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(translation),
          backgroundColor: Colors.deepPurple,
          duration: const Duration(seconds: 3),
        ),
      );
  }

  // Cambia el idioma y muestra un SnackBar correspondiente.
  static void _setLocale(
      BuildContext context, Locale newLocale, String translation) {
    context.setLocale(newLocale).then((value) {
      _showLanguageSwitched(context, translation);
      Navigator.pop(context);
    });
  }
}
