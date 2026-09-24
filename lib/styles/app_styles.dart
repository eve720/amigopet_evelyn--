import 'package:flutter/material.dart';

class AppStyles {

  static const Color primaryColor = Colors.teal;

  static const Color backgroundColor = Color(0xFFF5F5F5);

  static const Color cardColor = Colors.white;

  static const TextStyle title = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 17,
    color: Colors.grey,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
  );

  static final ButtonStyle primaryButton = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 14),
  );

  static final ButtonStyle outlineButton = OutlinedButton.styleFrom(
    foregroundColor: primaryColor,
    padding: const EdgeInsets.symmetric(vertical: 14),
  );
}