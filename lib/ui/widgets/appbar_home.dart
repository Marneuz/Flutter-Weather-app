import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';
import 'package:jgimeno_weather/ui/models/language_manager.dart';
import 'package:jgimeno_weather/ui/screens/select_city.dart';
import 'package:jgimeno_weather/utils/transition_nav.dart';

class AppBarHome extends StatefulWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  State<AppBarHome> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

class _MyAppBarState extends State<AppBarHome> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight + 20,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Usa BlocBuilder para escuchar los cambios de estado del WeatherBloc.
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              // Muestra el nombre de la ciudad actual o la ciudad seleccionada.
              String cityName = state is WeatherSuccess
                  ? state.weather.areaName ?? "Unknown Area"
                  : BlocProvider.of<WeatherBloc>(context).selectedCity;
              return Text(
                cityName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
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
                                  LanguageManager.switchToSpanish(context),
                            ),
                            ListTile(
                              title: Text(LocaleKeys.English.tr()),
                              onTap: () =>
                                  LanguageManager.switchToEnglish(context),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              // Botón para buscar y seleccionar una nueva ciudad.
              IconButton(
                icon: const Icon(
                  size: 30,
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    TransitionNav(
                        builder: (context) => const SelectCityScreen(),
                        settings: const RouteSettings()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
