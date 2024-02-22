import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date({
    super.key,
    required this.date,
    this.style,
  });

  final DateTime date;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final dateFormat =
        DateFormat("EEEE, dd • HH:mm", context.locale.toString());
    final formattedDate = dateFormat.format(date);

    return Center(
      child: Text(
        formattedDate,
        style: style ??
            const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
      ),
    );
  }
}
