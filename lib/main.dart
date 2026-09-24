import 'package:flutter/material.dart';
import 'pages/cuidadores_pages.dart';
import 'styles/app_styles.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPet',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppStyles.primaryColor,
        ),
        scaffoldBackgroundColor: AppStyles.backgroundColor,
        useMaterial3: true,
      ),

      home: const CuidadoresPage(),
    );
  }
}
