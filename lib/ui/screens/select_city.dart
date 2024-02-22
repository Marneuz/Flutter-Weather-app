import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/ui/localization/generated/locale_keys.g.dart';
import 'package:jgimeno_weather/ui/screens/home_screen.dart';
import 'package:jgimeno_weather/ui/widgets/appbar_select_city.dart';
import 'package:jgimeno_weather/ui/widgets/city_list_gradient_background.dart';
import 'package:jgimeno_weather/ui/widgets/time_based_background.dart';
import 'package:jgimeno_weather/ui/models/suggested_cities.dart';
import 'package:jgimeno_weather/utils/transition_nav.dart';

class SelectCityScreen extends StatefulWidget {
  const SelectCityScreen({super.key});

  @override
  State<SelectCityScreen> createState() => _SelectCityScreenState();
}

class _SelectCityScreenState extends State<SelectCityScreen> {
  final TextEditingController _textController = TextEditingController();
  final _textFocusNode = FocusNode();

  // Lista filtrada de ciudades para mostrar como sugerencia.
  List<String> filteredCities = [];
  bool showCitiesList = false;

  // Busca el clima para la ciudad seleccionada y navega a la pantalla principal
  void _searchWeather(BuildContext context, String cityName) {
    if (cityName.isNotEmpty) {
      BlocProvider.of<WeatherBloc>(context)
          .add(FetchWeather.byCityName(cityName: cityName));
      Navigator.pushReplacement(
          context,
          TransitionNav(
              builder: (context) => HomeScreen(cityName: cityName),
              settings: const RouteSettings()));
    }
  }

  // Cambia el estado de visualización de la lista de ciudades
  void _toggleCityList() {
    setState(() {
      showCitiesList = !showCitiesList;
      if (showCitiesList) {
        filteredCities = cities;
        _textFocusNode.unfocus();
      }
    });
  }

  // Filtra las ciudades basándose en la consulta de búsqueda
  void _filterCities(String query) {
    filteredCities = cities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      showCitiesList = query.isNotEmpty;
    });
  }

  // Limpia los recursos al salir de la pantalla
  @override
  void dispose() {
    _textController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  // Construye la interfaz de usuario de la pantalla
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _textFocusNode.unfocus();
        setState(() {
          showCitiesList = false;
        });
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: const AppBarSelectCity(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const TimeBasedBackground(),
                SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/city.png",
                          width: 255,
                        ),
                        Text(
                          LocaleKeys.Fetch_Weather_by_a_City.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 26.0),
                        _buildCitySearchField(),
                        // Lista de ciudades filtradas
                        if (showCitiesList) _buildCityList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Construye el campo de búsqueda de ciudades
  Widget _buildCitySearchField() {
    return TextField(
      controller: _textController,
      focusNode: _textFocusNode,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: LocaleKeys.City_Name.tr(),
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: IconButton(
            icon: Icon(
              showCitiesList ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              color: Colors.white,
            ),
            onPressed: () => _toggleCityList()),
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () => _searchWeather(context, _textController.text.trim()),
        ),
      ),
      onChanged: _filterCities,
    );
  }

  // Construye la lista de ciudades filtradas
  Widget _buildCityList() {
    return CityListGradientBackground(
      child: Column(
        children: filteredCities
            .map(
              (city) => ListTile(
                title: Text(
                  city,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  _textController.text = city;
                  _searchWeather(context, _textController.text.trim());
                  _textFocusNode.unfocus();
                  setState(
                    () {
                      showCitiesList = false;
                    },
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
