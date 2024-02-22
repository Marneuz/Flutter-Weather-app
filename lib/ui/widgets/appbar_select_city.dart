import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/data/remote/geolocation_service.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';
import 'package:jgimeno_weather/ui/models/language_manager.dart';
import 'package:jgimeno_weather/ui/screens/home_screen.dart';
import 'package:jgimeno_weather/utils/exception_handler.dart';
import 'package:jgimeno_weather/utils/transition_nav.dart';

class AppBarSelectCity extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSelectCity({super.key});

  @override
  State<AppBarSelectCity> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _MyAppBarState extends State<AppBarSelectCity> {
  // Metodo para manejar la obtencion de la ubicacion actual
  void _handleGetCurrentLocation() async {
    try {
      // Intenta obtener la posición actual
      final currentPosition = await GeolocationService().determinePosition();
      if (!mounted) return;

      final weatherBloc = BlocProvider.of<WeatherBloc>(context, listen: false);
      weatherBloc.add(FetchWeather.byLocation(position: currentPosition));

      // Navega a la pantalla principal con la ciudad actual.
      Navigator.pushReplacement(
        context,
        TransitionNav(
          builder: (context) => const HomeScreen(cityName: ''),
          settings: const RouteSettings(),
        ),
      );
    } catch (e) {
      // Si ocurre un error, muestra un snackbar con el mensaje de error.
      if (!mounted) return;
      ExceptionHandler.showErrorSnackBar(context, e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 20,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),

      // Botón para volver a la pantalla anterior.
      leading: IconButton(
        icon: const Icon(
          size: 30,
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(
            context,
            TransitionNav(
                builder: (context) => const HomeScreen(
                      cityName: '',
                    ),
                settings: const RouteSettings()),
          );
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              // Botón para cambiar el idioma de la aplicación.
              IconButton(
                icon: const Icon(
                  size: 30,
                  Icons.language,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(LocaleKeys.Select_Language.tr()),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                                title: Text(LocaleKeys.Spanish.tr()),
                                onTap: () =>
                                    LanguageManager.switchToSpanish(context)),
                            ListTile(
                                title: Text(LocaleKeys.English.tr()),
                                onTap: () =>
                                    LanguageManager.switchToEnglish(context)),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              // Botón para volver a la ubicación actual del usuario.
              IconButton(
                icon: const Icon(
                  size: 30,
                  Icons.location_on,
                  color: Colors.red,
                ),
                onPressed: _handleGetCurrentLocation,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
