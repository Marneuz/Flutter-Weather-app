import 'dart:async';

import 'package:flutter/material.dart';

class ExceptionHandler {
  // Este método puede ser llamado para manejar la excepción y devolver un mensaje adecuado.
  static String handleException(dynamic exception) {
    if (exception is NetworkException) {
      return _handleNetworkException(exception);
    } else if (exception is ApiException) {
      return _handleApiException(exception);
    } else if (exception is TimeoutException) {
      return "Connection timeout, please try again later.";
    } else if (exception is LocationException) {
      return _handleLocationException(exception);
    } else {
      // Para cualquier otro tipo de error no específico.
      return "An unexpected error occurred. Please try again.";
    }
  }

  // Método para mostrar un SnackBar con un mensaje de error
  static void showErrorSnackBar(BuildContext context, dynamic exception) {
    final message = handleException(exception);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Maneja NetworkException
  static String _handleNetworkException(NetworkException exception) {
    return "No Internet connection. Please check your network settings.";
  }

  // Maneja ApiException
  static String _handleApiException(ApiException exception) {
    return "Error from API: ${exception.message}";
  }

  // Maneja LocationException
  static String _handleLocationException(LocationException exception) {
    return "Location error: ${exception.message}";
  }
}

// Clases de excepción
class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class LocationException implements Exception {
  final String message;
  LocationException(this.message);
}
