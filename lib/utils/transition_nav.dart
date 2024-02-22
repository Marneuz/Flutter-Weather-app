import 'package:flutter/material.dart';

class TransitionNav<T> extends MaterialPageRoute<T> {
  final AxisDirection direction;

  TransitionNav({
    required super.builder,
    required RouteSettings super.settings,
    this.direction = AxisDirection.right,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // Punto inicio de animación
    Offset beginOffset;
    switch (direction) {
      case AxisDirection.up:
        beginOffset = const Offset(0.0, 1.0);
        break;
      case AxisDirection.down:
        beginOffset = const Offset(0.0, -1.0);
        break;
      case AxisDirection.left:
        beginOffset = const Offset(1.0, 0.0);
        break;
      case AxisDirection.right:
      default:
        beginOffset = const Offset(-1.0, 0.0);
        break;
    }

    return SlideTransition(
      position: Tween<Offset>(
        begin: beginOffset,
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
