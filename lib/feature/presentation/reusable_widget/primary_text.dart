import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const PrimaryText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
