import 'dart:ui';

import 'package:flutter/material.dart';

class TimeBasedBackground extends StatelessWidget {
  const TimeBasedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la hora actual
    final hour = DateTime.now().hour;

    // Determinar el fondo basado en la hora del día
    Gradient gradient;
    if (hour >= 7 && hour < 12) {
      // Mañana
      gradient = const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Color(0xFF64B5F6), // Azul claro
          Color(0xFF9575CD), // Morado claro
        ],
      );
    } else if (hour >= 12 && hour < 18) {
      // Mediodía
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF42A5F5), // Azul claro
          Color(0xFF1976D2), // Azul oscuro
        ],
      );
    } else if (hour >= 18 && hour < 21) {
      // Atardecer
      gradient = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFFA726), // Anaranjado
          Color(0xFF64B5F6), // Azul claro
        ],
      );
    } else {
      // Noche
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF303F9F), // Azul oscuro
          Color(0xFF512DA8), // Morado oscuro
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }
}
