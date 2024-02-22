import 'package:flutter/material.dart';

class CityListGradientBackground extends StatelessWidget {
  final Widget child;

  const CityListGradientBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;

    Gradient gradient;
    if (hour >= 7 && hour < 12) {
      // Mañana
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFB39DDB), // Lavanda claro
          Color(0xFF90CAF9), // Azul cielo claro
        ],
      );
    } else if (hour >= 12 && hour < 18) {
      // Mediodía
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF81D4FA), // Azul cielo
          Color(0xFF64B5F6), // Azul claro
        ],
      );
    } else if (hour >= 18 && hour < 21) {
      // Atardecer
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFFFFCC80), // Anaranjado claro
          Color(0xFF81D4FA), // Azul cielo
        ],
      );
    } else {
      // Noche
      gradient = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF7986CB), // Azul lavanda
          Color(0xFF5C6BC0), // Azul índigo claro
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      constraints: const BoxConstraints(
        maxHeight: 350,
      ),
      child: SingleChildScrollView(child: child),
    );
  }
}
