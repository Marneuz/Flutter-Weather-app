import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/ui/models/weather_icon.dart';
import 'package:jgimeno_weather/ui/models/weather_state_handler.dart';
import 'package:jgimeno_weather/ui/widgets/appbar_home.dart';
import 'package:jgimeno_weather/ui/widgets/date.dart';
import 'package:jgimeno_weather/ui/widgets/max_temp.dart';
import 'package:jgimeno_weather/ui/widgets/min_temp.dart';
import 'package:jgimeno_weather/ui/widgets/sunrise.dart';
import 'package:jgimeno_weather/ui/widgets/sunset.dart';
import 'package:jgimeno_weather/ui/widgets/temperature.dart';
import 'package:jgimeno_weather/ui/widgets/time_based_background.dart';
import 'package:jgimeno_weather/ui/widgets/weather_conditions.dart';

class HomeScreen extends StatefulWidget {
  final String cityName;

  const HomeScreen({
    super.key,
    required this.cityName,
  });

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Solicita el clima para la ciudad proporcionada si no está vacía
    if (widget.cityName.isNotEmpty) {
      BlocProvider.of<WeatherBloc>(context, listen: false)
          .add(FetchWeather.byCityName(cityName: widget.cityName));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: const AppBarHome(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const TimeBasedBackground(),

              // Escucha los cambios de estado en WeatherBloc
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return WeatherStateHandler.handleState(
                    state: state,
                    context: context,
                    onSuccess: (weatherState) =>
                        _buildWeatherSuccessContent(weatherState),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Construye el contenido de la UI cuando se obtiene el clima con éxito
  Widget _buildWeatherSuccessContent(WeatherSuccess state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          getWeatherIcon(state.weather.weatherConditionCode!),
          Temperature(
            temperature: state.weather.temperature!.celsius!.round(),
          ),
          WeatherConditions(
            weatherMain: state.weather.weatherMain!,
          ),
          const SizedBox(height: 5),
          Date(date: state.weather.date!),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: Sunrise(sunrise: state.weather.sunrise!)),
              Expanded(child: Sunset(sunset: state.weather.sunset!)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Divider(color: Colors.grey),
          ),
          Row(
            children: [
              Expanded(
                child: MaxTemperature(
                  temperature: state.weather.tempMax!.celsius!.round(),
                ),
              ),
              Expanded(
                child: MinTemperature(
                  temperature: state.weather.tempMin!.celsius!.round(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
