import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/data/remote/geolocation_service.dart';
import 'package:jgimeno_weather/ui/localization/generated/codegen_loader.g.dart';
import 'package:jgimeno_weather/ui/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final geolocationService = GeolocationService();

  // Inicio de la aplicación con soporte para localización
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("es")],
      path: "assets/translations",
      fallbackLocale: const Locale("en"),
      assetLoader: const CodegenLoader(),
      child: MyApp(geolocationService: geolocationService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GeolocationService geolocationService;

  // Constructor de MyApp con el servicio de geolocalización requerido
  const MyApp({super.key, required this.geolocationService});

  @override
  Widget build(BuildContext context) {
    // Proveedor del bloc a lo largo de toda la aplicació
    return BlocProvider<WeatherBloc>(
      create: (context) => WeatherBloc(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        home: LocationHandler(geolocationService: geolocationService),
      ),
    );
  }
}

class LocationHandler extends StatefulWidget {
  final GeolocationService geolocationService;

  // Constructor de LocationHandler con el servicio de geolocalización
  const LocationHandler({super.key, required this.geolocationService});

  @override
  LocationHandlerState createState() => LocationHandlerState();
}

class LocationHandlerState extends State<LocationHandler> {
  late Future<Position> _positionFuture;
  bool _locationFetched = false;

  @override
  void initState() {
    super.initState();

    // Obtiene la posición actual al iniciar el estado
    _positionFuture = widget.geolocationService.determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    // Constructor del futuro para manejar la obtención de la ubicación
    return FutureBuilder<Position>(
      future: _positionFuture,
      builder: (context, snapshot) {
        // Manejo de los diferentes estados del futuro
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('location_error'.tr()),
            ),
          );
        } else if (snapshot.hasData) {
          // Comprueba si la ubicación ya ha sido obtenida anteriormente
          if (!_locationFetched) {
            _locationFetched = true; // Marca que la ubicación ha sido obtenida
            BlocProvider.of<WeatherBloc>(context).add(
              FetchWeather.byLocation(position: snapshot.data!),
            );
          }
          return const HomeScreen(cityName: '');
        } else {
          return Scaffold(
            body: Center(
              child: Text('unexpected_error'.tr()),
            ),
          );
        }
      },
    );
  }
}
