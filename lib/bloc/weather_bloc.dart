import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jgimeno_weather/data/api_key.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  String selectedCity = '';

  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      // Lógica para manejar FetchWeather
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory(API_KEY);
        Weather weather;

        if (event.isByLocation) {
          weather = await wf.currentWeatherByLocation(
            event.position.latitude,
            event.position.longitude,
          );
        } else {
          weather = await wf.currentWeatherByCityName(event.cityName);
          selectedCity = event.cityName;
        }

        emit(WeatherSuccess(weather));
      } catch (e) {
        // Convertir cualquier error capturado en una Exception
        final exception = e is Exception ? e : Exception(e.toString());
        emit(WeatherFailure(exception));
      }
    });
  }
}
