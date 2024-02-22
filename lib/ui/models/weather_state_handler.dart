import 'package:flutter/material.dart';
import 'package:jgimeno_weather/bloc/weather_bloc.dart';
import 'package:jgimeno_weather/utils/exception_handler.dart';

class WeatherStateHandler {
  static Widget handleState({
    required WeatherState state,
    required BuildContext context,
    required Widget Function(WeatherSuccess) onSuccess,
    Widget? onLoading,
    Widget? onFailure,
  }) {
    if (state is WeatherLoading) {
      return onLoading ?? const Center(child: CircularProgressIndicator());
    } else if (state is WeatherSuccess) {
      return onSuccess(state);
    } else if (state is WeatherFailure) {
      final errorMessage = ExceptionHandler.handleException(state.error);
      return Center(
        child: onFailure ??
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 25,
              ),
            ),
      );
    } else {
      return const SizedBox();
    }
  }
}
